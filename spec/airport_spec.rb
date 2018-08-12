require "airport"

describe Airport do
  # let mocking functions can go there e.g. ...
  # let(:mockWeather)  { double :weather, good?: true}
  describe "when first initialized"
    it { is_expected.not_to eql(nil) }

  it "returns true or false when good_weather? is called" do
    expect(subject.good_weather?).to eq(true).or eq(false)
  end
end
