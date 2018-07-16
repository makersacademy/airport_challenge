require 'weather'

describe Weather do
  it { is_expected.to be_a Weather }

  describe "#generate_weather" do
    it "returns a number showing severity of weather" do
      expect(subject.generate_weather).to be_within(5).of(5)
    end
  end
end
