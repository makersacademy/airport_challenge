require 'plane'

describe Plane do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
  end

  describe '#Flying' do

    it "shouldn't allow planes to land when they are at an airport" do
      allow(@airport).to receive(:roll) { 1 }
      @airport.change_weather
      @plane.land(@airport)
      expect{ (@plane.land(@airport)) }.to raise_error("Plane #{@plane.flight_number} is already grounded at an airport")
    end

    it "shouldn't allow plane to take off when plane is already flight" do
      expect { @plane.take_off }.to raise_error("Plane #{@plane.flight_number} is flying and so cannot take off!")
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
