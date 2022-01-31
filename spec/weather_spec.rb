require './lib/weather'

describe Weather do
  describe "#stormy" do
    it { is_expected.to respond_to(:stormy) }

    it "should return the weather as stormy" do
      weather = Weather.new
      expect(weather.stormy).to eq "Stormy"
    end
  end 
end 
