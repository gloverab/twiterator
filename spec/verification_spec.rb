require_relative '../config/environment.rb'

describe "Reply" do
  bad_verify = Verification.new('lkasdfkjgkjl')
  good_verify = Verification.new('kanywest')

  describe '#verify' do
    it "Initializes with a username to check later on, then #verify checks it." do
      expect(bad_verify.verify).to be_falsey
    end
  end

end
