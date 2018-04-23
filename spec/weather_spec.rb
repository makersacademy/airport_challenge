require 'weather'

describe Weather do
  describe '#stormy?' do
    it { is_expected.to respond_to(:stormy?) }
  end
  
  describe '#wind_speed' do  
    it { is expected.to respond_to(:wind_speed) }
    
    it 'generates a wind speed integer 0-40' do
      40.times do
        weather = Weather.new
        expect(weather.wind_speed).to be_between(0, 40).inclusive
      end
    end  
  end
end
