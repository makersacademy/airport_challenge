require 'airport'
require 'plane'
describe Airport do

  it 'responds to land method' do
    expect(subject).to respond_to :land
  end

  it 'responds to take_off method' do
    expect(subject).to respond_to :take_off
  end
end

describe '#land' do
  airport = Airport.new
  plane = Plane.new

  it 'lands a plane' do
    expect(airport.land(plane)).to eq [plane]
  end

  it 'requires 1 argument' do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it 'raises an error when full' do
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
    expect { airport.take_off }.to raise_error 'No planes'
  end

  it 'confirms the plane is in the air' do
    airport.land(Plane.new)
    expect(airport.take_off).to eq "The plane is in the air"
  end
end
