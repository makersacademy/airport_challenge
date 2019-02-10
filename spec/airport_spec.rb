require "airport.rb"
require 'plane.rb'
describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it 'can land a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.land(plane)).to eq plane.plane_landed
  end

  it 'can check weather for landing' do
    plane = Plane.new
    airport = Airport.new
    allow(airport.land(plane)).to receive(:weather)
  end

  it 'can take off a plane' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.take_off(plane)).to eq plane.plane_flying?
  end

  it 'confirms plane not at airport' do
    plane = Plane.new
    airport = Airport.new
    expect(airport.take_off(plane)).to eq true
  end

  it 'can check weather to takeoff if stormy' do
    plane = Plane.new
    airport = Airport.new
    allow(airport.take_off(plane)).to receive(:weather)
  end

  it 'airpot full' do
    plane = Plane.new
    airport = Airport.new
    expect { airport.land(plane) }.to raise_error("airport is full")
  end

end
