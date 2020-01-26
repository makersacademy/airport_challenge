require 'plane.rb'
require 'airport.rb'

describe Plane do

  it 'There should be planes' do
  end

  it 'Plane should respond to land' do
    expect(subject).to respond_to(:land)
  end

  it 'Planes should land at airports' do
    airport = Airport.new
    allow(airport).to receive(:weather) { 'sunny' }
    expect(subject.land(airport)).to eq('landing')
  end

  it 'Planes should only land at airports' do
    airport = 'not an airport'
    expect { subject.land(airport) }.to raise_error('invalid airport')
  end

  it 'Planes should respond to take_off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'Planes should take off from airports and return new location (sky)' do
    airport = Airport.new
    allow(airport).to receive(:weather) { 'sunny' }
    plane = Plane.new(airport)
    expect(plane.take_off(airport)).to eq('sky')
  end

  it 'Planes should only take off from the airport they are at' do
    airport_1 = Airport.new
    airport_2 = Airport.new
    allow(airport_1).to receive(:weather) { 'sunny' }
    allow(airport_2).to receive(:weather) { 'sunny' }
    plane = Plane.new(airport_1)
    expect { plane.take_off(airport_2) }.to raise_error('invalid take off location')
  end

  it 'Planes can not take off if they are already in the sky' do
    expect { subject.take_off('sky') }.to raise_error('plane already in the air')
  end

  it 'Planes can not land if the airport is full' do
    airport = Airport.new(0)
    allow(airport).to receive(:weather) { 'sunny' }
    expect { subject.land(airport) }.to raise_error('airport is full')
  end

  it 'Plane.take_off should raise_error if weather is stormy' do
    airport = Airport.new
    allow(airport).to receive(:weather) { 'stormy' }
    plane = Plane.new(airport)
    expect { plane.take_off(airport) }.to raise_error('take off not possible - stormy weather')
  end

end
