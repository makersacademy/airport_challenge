require 'airport'

RSpec.describe Airport do

  it { is_expected.to respond_to(:land) }  
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off) }
  it { is_expected.to respond_to(:take_off).with(1).argument }

  describe '#land' do
    it "can instruct a plane to land at an airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = Plane.new
      airport.land(plane)
      expect(airport.planes_in_airport.include?(plane)).to eq(true) 
    end

    it "prevents landing when weather is stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy).and_return(true)
      expect { airport.land(plane) }.to raise_error("No landings permitted")
    end

    it "prevents landing when airport is full" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = Plane.new
      plane2 = Plane.new
      airport.land(plane)
      expect { airport.land(plane2) }.to raise_error("No landings permitted")
    end
  end

  describe '#take_off' do
    it "can instruct a plane to take off and confirm that the plane has left the airport" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(false)
      plane = Plane.new
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes_in_airport.include?(plane)).to eq(false)
    end

    it "prevents take off when weather is stormy" do
      airport = Airport.new
      plane = Plane.new
      allow(airport).to receive(:stormy).and_return(false)
      airport.land(plane)
      allow(airport).to receive(:stormy).and_return(true)
      expect { airport.take_off(plane) }.to raise_error("No take offs permitted")
    end
  end

  describe '#stormy' do
    it "checks if weather is stormy" do
      airport = Airport.new
      allow(airport).to receive(:stormy).and_return(true)
      expect(airport.stormy).to eq(true)
    end
  end  

  describe '#capacity_reached?' do
    it "checks if capacity is reached" do
      airport = Airport.new 
      allow(airport).to receive(:stormy).and_return(false)
      airport.land(Plane.new)
      expect(airport.capacity_reached?).to eq(true)
    end
  end

  it "initiates with a default airport capacity" do
    airport = Airport.new
    expect(airport.capacity).to eq(1)
  end

  it "lets the default capacity to be overridden" do
    airport = Airport.new(10)
    expect(airport.capacity).to eq(10)
  end

end