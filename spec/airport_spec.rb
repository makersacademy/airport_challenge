require "airport"

describe Airport do
  # let mocking functions can go there e.g. ...
  # let(:mockWeather)  { double :weather, good?: true}
  describe "when first initialized"
    it { is_expected.not_to eql(nil) }

  describe "#land"
    it { is_expected.to respond_to :land }

    it "takes 1 argument" do
      expect(subject).to respond_to(:land).with(1).arguments
    end

  describe "#take_off"
    it { is_expected.to respond_to :take_off }
    
    it "takes 1 argument" do
      expect(subject).to respond_to(:take_off).with(1).arguments
    end

end
