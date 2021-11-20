require 'airport'
require 'plane'
require 'weather'

describe Airport do 
  it { is_expected.to respond_to :land }

  it { is_expected.to respond_to :take_off }

  it "When I land a plane, I expect that plane to be at the airport" do 
    airport = Airport.new
    boeing = Plane.new
    airport.land(boeing)
    expect(airport.planes).to include boeing
  end

  it "After instructing a plane to take off, I expect that plane to not be in the airport" do 
    airport = Airport.new
    boeing = Plane.new
    airport.land(boeing)
    airport.take_off
    expect(airport.planes).to be_empty
  end

  it "Prevents landing a plane when the airport is full" do 
    airport = Airport.new
    airport.capacity.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error "Airport is full"
  end

  it "You can set the capacity of the airport" do 
    airport = Airport.new
    airport.capacity = 10
    expect(airport.capacity).to eq 10
  end

  
end

describe Weather do 
  it { is_expected.to respond_to :stormy? }
end
