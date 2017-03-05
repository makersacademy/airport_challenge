require 'weather'

describe Weather do
  subject(:weather) {Weather.new}

  it {is_expected.to respond_to(:stormy)}
  it {is_expected.to respond_to(:get_weather) }

  describe "#get_weather" do
    it "will return @stormy if number is more than 6" do
      subject.get_weather(7)
      expect(subject.stormy).to eq true
    end
    it "stormy will be false if number is six or less" do
      subject.get_weather(6)
      expect(subject.stormy).to eq false
    end
  end

end
