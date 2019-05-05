require 'plane'
require 'airport'
require 'weather'

describe Plane do
  it 'land a plane' do
    plane = Plane.new
    airport = Airport.new
    weather = double
    allow(weather).to receive(:condition) { 'good' }
    plane.land(weather, airport)
    expect(plane.location).to eq(airport)
  end

  it 'takeoff a plane' do
    plane = Plane.new
    airport = Airport.new
    weather = double
    allow(weather).to receive(:condition) { 'good' }
    plane.land(weather, airport)
    expect(plane.takeoff(weather, airport)).to eq('sky')
  end

  it 'bad weather stops takeoff' do
    plane = Plane.new
    airport = Airport.new
    # weather = Weather.new
    weather = double
    allow(weather).to receive(:condition) { 'good' }
    plane.land(weather, airport)
    allow(weather).to receive(:condition) { 'bad' }
    expect { plane.takeoff(weather, airport) } .to raise_error("can\'t takeoff in bad weather")
  end

  it 'bad weather stops landing' do
    plane = Plane.new
    airport = Airport.new
    # weather = Weather.new
    weather = double
    allow(weather).to receive(:condition) { 'bad' }
    expect { plane.land(weather, airport) } .to raise_error("can\'t land in bad weather")
  end

  it 'already landed stops landing' do
    plane = Plane.new
    airport = Airport.new
    weather = double
    allow(weather).to receive(:condition) { 'good' }
    plane.land(weather, airport)
    expect { plane.land(weather, airport) } .to raise_error("can\'t land if you already did")
  end
end
