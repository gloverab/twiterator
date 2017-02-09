class Reply
  attr_accessor :parent_tweet, :reply_number, :author, :content

  def initialize(index, parent_tweet)
    @index = index
    @parent_tweet = parent_tweet
  end

  def author
    @author = self.parent_tweet.doc.css('.stream-items b')[@index].text
  end

  def content
    @content = self.parent_tweet.doc.css('.stream-items p')[@index].text
  end

  def time
    #binding.pry
    self.parent_tweet.doc.css('.stream-items .stream-item-header .time a')[@index].values[2].split(" - ")[0]
  end

  def date
    self.parent_tweet.doc.css('.stream-items .stream-item-header .time a')[@index].values[2].split(" - ")[1]
  end

  def show_five
    puts "\n#{self.display_name.upcase}'S MOST RECENT TWEETS:\n"
    @counter = 0
    until self.counter == 5
      tweet_cycle
    end
  end

end
