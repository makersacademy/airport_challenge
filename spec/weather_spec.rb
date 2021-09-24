require 'weather'

describe Weather do
  describe "#random_weather" do
    it 'should return a random weather state, sunny if false, stormy if true' do
      weather = Weather.new
      expect(subject.random_weather).to eq "sunny" if weather.random_weather.eql? true
    end
  end

  describe "#random_weather" do
    it 'should return a random weather state, sunny if false, stormy if true' do
      weather = Weather.new
      expect(subject.random_weather).to eq "stormy" if weather.random_weather.eql? false
    end
  end

  describe "#weather_stormy?" do
    it "should return boolean if weather is stormy" do
      weather = Weather.new
      expect(subject.weather_stormy?).to eq true if weather.random_weather.eql? false
    end
  end

  describe "#get_weather_status" do
    it 'should return the weather status (sunny or stormy) as a string' do
      weather = Weather.new
      expect(subject.get_weather_status).to eq "stormy" if weather.weather_stormy?.eql? false
    end
  end

end
