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

  describe '#Land' do

    it "should allow planes to land when weather is sunny" do
      allow(@airport).to receive(:roll) { 1 }
      @airport.change_weather
      expect(@airport.land(@plane)).to eq "Plane #{@plane.flight_number} has landed at the airport"
    end

    it "should prevents planes landing when weather is stormy by throwing error" do
      allow(@airport).to receive(:roll) { 6 }
      @airport.change_weather
      expect { @airport.land(@plane) }.to raise_error("Stormy weather prohibits landing")
    end

    it "should not allow planes to land when airport has reached max capacity" do
      airport = Airport.new(1)
      airport.land(@plane)
      expect { airport.land(@plane) }.to raise_error("Airport is at maximum capacity")
    end

  end

  describe '#Take Off' do

    it "should allow planes to take off when weather is sunny" do
      allow(@airport).to receive(:roll) { 1 }
      @airport.change_weather
      expect(@airport.take_off(@plane)).to eq "Plane #{@plane.flight_number} has taken off from the airport"
    end

    it "should prevents planes from taking off when weather is stormy by throwing error" do
      allow(@airport).to receive(:roll) { 6 }
      @airport.change_weather
      expect { @airport.take_off(@plane) }.to raise_error("Stormy weather prohibits take off")
    end

  end

end
