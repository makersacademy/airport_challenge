require 'Weather'

describe Weather do
  it { is_expected.to respond_to(:current_weather) }
  it { is_expected.to respond_to(:forecast) }

  describe "#forecast" do

    it "change the current weather to clear or stormy" do
      subject.forecast
      expect(subject.current_weather).to eq("clear").or eq("stormy")
    end
  end

end
