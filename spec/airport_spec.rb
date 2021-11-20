require 'airport'
require 'plane'

describe Airport do 
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it "When I land a plane, I expect that plane to be at the airport" do 
    airport = Airport.new
    boeing = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(boeing)
    expect(airport.planes).to include boeing
  end

  it "After instructing a plane to take off, I expect that plane to not be in the airport if the weather is not stormy" do 
    airport = Airport.new
    boeing = Plane.new
    allow(airport).to receive(:stormy?).and_return(false)
    airport.land(boeing)
    airport.take_off
    expect(airport.planes).to be_empty
  end

  it "Prevents landing a plane when the airport is full" do 
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return(false)
    airport.capacity.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error "Airport is full"
  end

  it "You can set the capacity of the airport" do 
    airport = Airport.new
    airport.capacity = 10
    expect(airport.capacity).to eq 10
  end

  it "If the weather is stormy, you should not be able to take off" do 
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return(false)
    airport.capacity.times { airport.land Plane.new }
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.take_off }.to raise_error "Stormy weather, can't take off"
  end

  it "If the weather is stormy, you should not be able to land" do 
    airport = Airport.new
    allow(airport).to receive(:stormy?).and_return(true)
    expect { airport.land(Plane.new) }.to raise_error "Stormy weather, can't land"
  end

end
