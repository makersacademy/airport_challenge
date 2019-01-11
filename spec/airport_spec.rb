require 'airport'

describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end



  describe '#new' do

    it "should allow an Airport object to initalize with default weather as Sunny" do
      expect(@airport.weather).to eq "Sunny"
    end

  end

  describe '#change_weather' do

    it "should set weather as Sunny when a 6 isn't rolled" do
      allow(@airport).to receive(:roll) { 1 }
      @airport.change_weather
      expect(@airport.weather).to eq "Sunny"
    end

    it "should set weather as Stormy when a 6 is rolled" do
      allow(@airport).to receive(:roll) { 6 }
      @airport.change_weather
      expect(@airport.weather).to eq "Stormy"
    end

  end
end
