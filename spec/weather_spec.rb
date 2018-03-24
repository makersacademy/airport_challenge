require './lib/weather.rb'

describe Weather do

  describe '#roll_weather' do

    it "returns cloudy" do
      allow(Kernel).to receive(:rand).with(0..1).and_return(0)
      result = Weather.roll_weather
      expect(result).to eq("cloudy")
    end

  end

end
