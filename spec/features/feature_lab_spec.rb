# Feature lab
require 'airport'
require 'plane'

describe "Features lab:" do
  it 'Plane landing' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'Plane leaving' do
    airport = Airport.new(20)
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end

  it 'No activity when full' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return false
    20.times do
      airport.land(plane)
    end
    expect { airport.land(plane) }.to raise_error 'Cannot land plane; Airport full'
  end

  it 'No activity when stormy' do
    airport = Airport.new(20)
    plane = Plane.new
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error 'Cannot land plane; Weather is stormy!'
  end
end
