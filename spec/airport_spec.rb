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
end
