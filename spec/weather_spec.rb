require './lib/weather.rb'

describe Weather do

  describe '#roll_weather' do

    it "returns cloudy" do
      allow(Kernel).to receive(:rand).with(0..1).and_return(0)
      expect(Weather.roll_weather).to eq("cloudy")
    end

    it "returns clear" do
      allow(Kernel).to receive(:rand).with(0..1).and_return(1)

      expect(Weather.roll_weather).to eq("clear")
    end

  end

end
