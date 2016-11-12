require 'airport'
require 'plane'

describe Airport do

  it { is_expected.to respond_to :land}

  it 'is expected to land a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq "Flight #{plane} has landed."
  end

  it { is_expected.to respond_to :planes}

  it 'supposed to store a plane' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.planes).to eq [plane]
  end

  it { is_expected.to respond_to :take_off}

  it 'is expected to allow a plane to take off' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    expect(airport.take_off).to eq plane
  end

  it 'is expected to show that the plane is no longer in the airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    airport.take_off
    expect(airport.planes).to eq []
  end

  it { is_expected.to respond_to :is_it_stormy?}

end
