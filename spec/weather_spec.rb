require 'weather'

describe Weather do


  it { is_expected.to respond_to(:stormy?) }
  it { is_expected.to respond_to(:weather_setter_generator) }

  describe '#stormy?' do
    it "is equal to false" do
      weather = Weather.new
      expect(weather.stormy?).to eq false
    end


  end

  describe '#weather_setter_generator when stormy' do
    before :each do
    srand(9)

    it "produces a random number value between 1 - 10" do
      weather = Weather.new
      expect(weather.weather_setter_generator).to be == 9
      expect(weather.weather_setter_generator).to be >= 0
    end

    it "changes to true if weather_setter_generator is >= 9" do
      weather = Weather.new
      weather.weather_setter_generator
      expect(weather.stormy?).to eq true
    end
    end

  describe '#weather_setter_generator when not stormy' do
    before :each do
    srand(8)

    it "produces a random number value between 1 - 10" do
      weather = Weather.new
      expect(weather.weather_setter_generator).to be < 9
      expect(weather.weather_setter_generator).to be >= 0
    end

    it "changes to true if weather_setter_generator is >= 9" do
      weather = Weather.new
      weather.weather_setter_generator
      expect(weather.stormy?).to eq false
    end
    end
  end

  end




end