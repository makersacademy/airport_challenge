require "weather"

describe Weather do
  it { is_expected.to respond_to(:CONDITIONS) }

  describe "#get_condition" do
    it { is_expected.to respond_to(:get_condition) }

    it "returns a random weather condition" do
      expect(Weather::CONDITIONS).to include(subject.get_condition)
    end
  end
end
