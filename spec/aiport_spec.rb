require 'airport'
require 'plane'
describe Airport do

  it 'responds to land method' do
    allow(subject).to receive(:bad_weather?) { false }
    expect(subject).to respond_to :land
  end

  it 'responds to take_off method' do
    allow(subject).to receive(:bad_weather?) { false }
    expect(subject).to respond_to :take_off
  end
end

describe '#land' do
  airport = Airport.new
  plane = Plane.new

  it 'lands a plane' do
    allow(airport).to receive(:bad_weather?) { false }
    expect(airport.land(plane)).to eq [plane]
  end

  it 'requires 1 argument' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'raises an error when full' do
    allow(airport).to receive(:bad_weather?) { false }
    # this is maximum length -1 as we've already landed a plane in line 19!!
    9.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'Airport full'
  end
end

describe '#take_off' do
  airport = Airport.new
  plane = Plane.new

  it 'allows user to instruct a plane' do
    expect(plane).to be_instance_of Plane
  end

  it 'raises an error when empty' do
    allow(airport).to receive(:bad_weather?) { false }
    expect { airport.take_off }.to raise_error 'No planes'
  end

  it 'confirms the plane is in the air' do
    allow(airport).to receive(:bad_weather?) { false }
    airport.land(Plane.new)
    expect(airport.take_off).to eq "The plane is in the air"
  end
end

describe '#custom capcity' do
  airport = Airport.new(15)

  it 'raises an error when full' do
    allow(airport).to receive(:bad_weather?) { false }
    15.times { airport.land Plane.new }
    expect { airport.land Plane.new }.to raise_error 'Airport full'
  end
end

describe '#weather safety' do
  airport = Airport.new

  it 'raises an error when trying to land in stormy weather' do
    allow(airport).to receive(:bad_weather?) { true }
    expect { airport.land Plane.new }.to raise_error 'Dangerous weather!'
  end

  it 'raises an error when trying to land in stormy weather' do
    allow(airport).to receive(:bad_weather?) { false }
    airport.land(Plane.new)
    allow(airport).to receive(:bad_weather?) { true }
    expect { airport.take_off }.to raise_error 'Dangerous weather!'
  end
end
