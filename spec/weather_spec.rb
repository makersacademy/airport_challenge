require "weather"

describe Weather do

  describe "#initialize" do
    it "decides at random what the weather is" do
      subject = Weather.new
      expect(subject.stormy).to be(true).or be(false)
    end
  end

end
