 require 'weather'

describe Weather do
  it { is_expected.to respond_to(:stormy?) }
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }
  end

  it { is_expected.to respond_to(:wind_speed) }
  describe '#wind_speed' do
  it { is_expected.to respond_to(:wind_speed) }
    it 'gives an integer wind speed between 0 and 61' do
      30.times do
        weather = Weather.new
        expect(weather.wind_speed).to be_between(0, 61).inclusive
      end
      end
    end
  end
end
