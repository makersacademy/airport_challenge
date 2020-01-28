require 'airport'
require 'plane'

describe Airport do 

it 'instructs a plane to land' do
  airport = Airport.new(20)
  plane = Plane.new
  allow(airport).to receive(:stormy?).and_return false
  expect { airport.land(plane) }.not_to raise_error 
end

it 'instructs a plane to take off' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error 
end

it 'does not allow planes to land when airport is full' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false

    20.times{ airport.land(plane) }
    expect { airport.land(plane) }.to raise_error 'cannot land when airport full'
end

it 'does not allow planes to land when stormy' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error 'cannot land plane when stormy'
end
end