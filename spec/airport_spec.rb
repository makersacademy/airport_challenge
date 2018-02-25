require 'airport.rb'

describe Airport do
  it 'is an airport' do
    expect(subject).to be_an_instance_of(Airport)
  end

  it 'when a plane is instructed to land' do
    plane_double = double
    airport = Airport.new
    expect(airport).to respond_to(:land)
  end

  it 'when a plane is passed as an argument for land' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    expect(airport.land(plane_double))
  end

  it 'when instructing plane to land, return status as grounded' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    expect(airport.land(plane_double)).to eq('grounded')
  end

  it 'when instructing plane to takeoff' do
    plane_double = plane_double
    airport = Airport.new
    expect(airport).to respond_to(:takeoff)
  end

  it 'when plane is passed as an argument to takeoff' do
    plane_double = double('plane_double', status: 'grounded')
    airport = Airport.new
    expect(airport.takeoff(plane_double))
  end
end
