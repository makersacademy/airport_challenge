require 'weather'

describe Weather do

  it { is_expected.to respond_to(:stormy?) }
  it { is_expected.to respond_to(:weather_setter) }

  describe '#stormy?' do
    it "is equal to false" do
      weather = Weather.new
      expect(weather.stormy?).to eq false
    end
  end



end