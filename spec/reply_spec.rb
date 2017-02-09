require_relative '../config/environment.rb'

describe "Reply" do
  reply = Reply.new(1, Tweet.new("https://twitter.com/whoisMGMT/status/820114677455814657"))

  describe '#initialize' do
    it "Initializes with the crucial attributes of a reply." do

      #a lot of these values change on aminute-to-minute basis because of he immediate nature of twitter.
      expect(reply.author).to eq("lyamgaliger")
      expect(reply.content).to eq("@whoisMGMT that is so predictable")
      expect(reply.time).to eq("2:37 PM")
    end
  end

end
