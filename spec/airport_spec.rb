require 'airport'

describe Airport do

  it "plane lands and takes off" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.take_off(plane)).to eq plane
  end

  it 'can not take off if stormy' do
    airport = Airport.new
    plane = Plane.new
    airport.weather("stormy")
    expect { airport.take_off(plane) }.to raise_error 'plane cannot take off due to storm'
  end

  it 'plane landed at airport' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.planes_at_airport).to include plane
  end

  it 'can not land if airport is full' do
    airport = Airport.new
    plane = Plane.new
    Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
    plane2 = Plane.new
    expect { airport.land(plane2) }.to raise_error 'Airport is full'
  end

  it 'cannot land if it is stormy' do
    airport = Airport.new
    plane = Plane.new
    airport.weather("stormy")
    expect { airport.land(plane) }.to raise_error 'plane cannot land due to storm'
  end

end
