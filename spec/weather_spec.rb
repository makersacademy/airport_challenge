require_relative "../lib/weather"

describe Weather do 
  describe "#conditions" do
    it { is_expected.to respond_to(:conditions) }
    it "returns when initialised as Stormy" do
      weather = described_class.new(current_weather = "Stormy")
      expect(weather.conditions).to eq "Stormy"
    end
    it "returns a random weather change" do
      current = subject.conditions
      subject.change
      expect(subject.conditions).not_to eq current
    end
  end
end
