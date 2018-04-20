require 'weather'

describe Weather do
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }

    it 'is expected to be stormy for wind speeds over 35' do
      ((Weather::STORMY_WIND_SPEED + 1)..Weather::MAX_WIND_SPEED).each do |wind_speed|
        weather = Weather.new(wind_speed)
        expect(weather).to be_stormy
      end
    end

    it 'is expected not to be stormy for wind speeds under 35' do
      (0..Weather::STORMY_WIND_SPEED).each do |wind_speed|
        weather = Weather.new(wind_speed)
        expect(weather).not_to be_stormy
      end
    end
  end

  describe '#wind_speed' do
    it { is_expected.to respond_to(:wind_speed) }

    it 'gives an integer wind speed between 0 and 40' do
      50.times do
        weather = Weather.new
        expect(weather.wind_speed).to be_between(0, 40).inclusive
      end
    end
  end
end
