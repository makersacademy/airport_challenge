require "airport"

describe Airport do
  # let mocking functions can go there e.g. ...
  # let(:mockWeather)  { double :weather, good?: true}
  context "when first initialized" do
    it { is_expected.not_to eql(nil) }
  end

  describe "#good_weather?" do
    it "returns true or false" do
      expect(subject.good_weather?).to eq(true).or eq(false)
    end
  end
end
