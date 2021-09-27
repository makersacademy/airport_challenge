require "weather"

describe Weather do
  it { is_expected.to respond_to(:conditions) }

  describe "#condition" do
    it { is_expected.to respond_to(:condition) }

    it "returns a random weather condition" do
      expect(Weather::CONDITIONS).to include(subject.condition)
    end
  end
end
