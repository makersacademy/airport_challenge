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

  describe '#weather_setter_generator' do


    it "changes to true if weather_setter_generator is >= 9" do
      weather = Weather.new
           weather.stub(:weather_setter_generator) { 9 }

      weather.weather_setter
      expect(weather.stormy?).to eq true

    end
    end

  describe '#weather_setter_generator' do


    it "changes to true if weather_setter_generator is <= 9" do

      weather = Weather.new
                       weather.stub(:weather_setter_generator) { 8 }

      weather.weather_setter
      expect(weather.stormy?).to eq false


  end

  end




end