class User
  attr_accessor :user_name, :doc, :display_name, :counter, :tweets

  def initialize(user_name)
    html = open("https://twitter.com/#{user_name}")
    @doc = Nokogiri::HTML(html)
    @user_name = user_name
    @display_name = @doc.css('.ProfileHeaderCard-nameLink').text.strip
    @tweets = []
  end

  # These methods only ended up working in different classes, so that is where they reside now.
  # def self.verify_and_create_user(user_name)
  #   html = open("https://twitter.com/#{user_name}")
  #   # @doc = Nokogiri::HTML(html)
  #   rescue OpenURI::HTTPError => error
  #   response = error.io
  #   if !response.status.include?("404" || "Not Found")
  #     self.new(user_name)
  #   end
  # end

  # def real_account?
  #   rescue OpenURI::HTTPError => error
  #   response = error.io
  #   !response.status.include?("404" || "Not Found")
  # end

  def private?
    self.doc.css('.ProtectedTimeline h2').text == "This account's Tweets are protected." || false
  end

  def follower_count
    self.doc.css('.ProfileNav-item--followers a')[0].attr('title')
  end

  def following_count
    self.doc.css('.ProfileNav-item--following a')[0].attr('title')
  end

  def show_five
    @counter = 0
    until self.counter == 5
      tweet_cycle
    end
  end

  def five_more
    this_counter = counter + 5
    until counter == this_counter
      tweet_cycle
    end
  end

  def redisplay
    self.tweets.each_with_index do |tweet, index|
      puts "#{(index+1).to_s}. #{tweet.date} - #{tweet.time} -#{"**RETWEET**" if tweet.retweeted?}- #{tweet.content}"
      puts " "
    end
  end

  def tweet_cycle
    get_tweet
    tweet
    self.counter += 1
  end

  def tweet
    puts "#{(self.counter + 1).to_s}. #{self.tweets[self.counter].date} -#{"**RETWEET**" if tweets[counter].retweeted?}- #{self.tweets[self.counter].content}\n"
    puts " "
  end

  def get_tweet
    user = self
    path = self.doc.css('.js-stream-tweet')[counter].values[3]
    url = "https://www.twitter.com#{path}"
    self.tweets << Tweet.new(url, user)
  end

  def similar_users
    binding.pry
    display_name = self.doc.css('.related-users .fullname')[0].text
    user_name = self.doc.css('.related-users .username')[0].text
  end

end
