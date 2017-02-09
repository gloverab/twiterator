class Verification
  attr_accessor :user_name

  def initialize(user_name)
    @user_name = user_name.gsub(' ', '%20')
  end

  def verify
    html = open("https://twitter.com/#{self.user_name}")
    rescue OpenURI::HTTPError => error
    response = error.io
    if !response.status.include?("404" || "Not Found")
      true
    else
      false
    end
  end

end
