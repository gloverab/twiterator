require_relative '../config/environment.rb'

describe "Tweet" do
  tweet = Tweet.new('https://twitter.com/whoisMGMT/status/820115772554907648')

  describe '#initialize' do
    it "Initializes with all attributes of a tweet." do

      expect(tweet.url).to eq("https://twitter.com/whoisMGMT/status/820115772554907648")

      #a lot of these values change on aminute-to-minute basis because of he immediate nature of twitter.
      expect(tweet.content).to eq("Time to get serious")
      expect(tweet.user_name).to eq("whoisMGMT")
      expect(tweet.retweets).to eq("1,619")
      expect(tweet.likes).to eq("3,284")

      expect(tweet.user).to eq(nil)
      expect(tweet.set_replies).to eq("go time")
    end
  end

end
