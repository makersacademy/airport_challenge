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
   #before :each do
    #srand(9)

    it "changes to true if weather_setter_generator is >= 9" do
      weather = Weather.new
      weather.weather_setter
      expect(weather.stormy?).to eq true
    #end
    end
    end

  describe '#weather_setter_generator' do
    #before :each do
    #srand(0..8)


    it "changes to true if weather_setter_generator is <= 9" do
      weather = Weather.new
      weather.weather_setter
      expect(weather.stormy?).to eq false
    #end

  end

  end




end