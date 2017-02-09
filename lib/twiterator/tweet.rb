class Tweet
  attr_accessor :replies, :reply_counter
  attr_reader :html, :doc, :url, :user

  def initialize(url, user=nil)
    @html = open(url)
    @doc = Nokogiri::HTML(html)
    @url = url
    @user = user
    # Had these as setter/getters but it was more efficient to scale them down into methods:
    # @content = doc.css('.js-tweet-text-container p')[0].text
    # @display_name = doc.css('.permalink-header fullname').text
    # @user_name = doc.css('.js-action-profile-name b')[0].text.strip
    # @time = doc.css('.client-and-actions').text.strip.split(" - ")[0]
    # @date = doc.css('.client-and-actions').text.strip.split(" - ")[1]
    @replies = []
    # @retweets = doc.css('.request-retweeted-popup strong').text
    # @likes = doc.css('.js-stat-favorites strong').text
  end

  def content
    doc.css('.js-tweet-text-container p')[0].text
  end

  def display_name
    doc.css('.permalink-header fullname').text
  end

  def user_name
    doc.css('.js-action-profile-name b')[0].text.strip
  end

  def time
    doc.css('.client-and-actions').text.strip.split(" - ")[0]
  end

  def date
    doc.css('.client-and-actions').text.strip.split(" - ")[1]
  end

  def retweets
    doc.css('.request-retweeted-popup strong').text
  end

  def likes
    doc.css('.js-stat-favorites strong').text
  end

  def reply_count
    self.doc.css('.ProfileTweet-actionCount')[0].text.strip.gsub(/[^0-9]/, "").to_i
  end

  def retweeted?
    self.user_name.downcase != self.user.user_name.downcase || false
  end

  def set_replies
    reply_counter = 0
    #binding.pry
    # The code snippet in "reply_count" reads off the number of replies that there are, then would have helped this method loop for exactly that many times. Sadly, twitter only displays 15 replies to ruby, so I had to settle for a 15-iteration loop. So now the method just checks to see if the reply count is UNDER 15.
    (reply_count < 15 ? reply_count : 16).times do
        parent_tweet = self
        self.replies << Reply.new(reply_counter, parent_tweet)
        reply_counter += 1
      end
    self.replies.pop
  end

end

#Tweet.new('https://twitter.com/whoisMGMT/status/825122373749841920').set_replies
