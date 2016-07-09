require 'plane'
require 'airport'

describe Plane do

  it 'can take off' do
    airport = Airport.new
    airport.weather = 'sunny'
    expect(subject.take_off(airport)).to eq 'taken off'
  end

  it 'can provide confirmation that it has taken off' do
    airport = Airport.new
    airport.weather = 'sunny'
    subject.take_off(airport)
    expect(subject.status).to eq 'taken off'
  end

  it 'wont take off if weather is stormy' do
    airport = Airport.new
    airport.weather = 'stormy'
    expect{subject.take_off(airport)}.to raise_error 'stormy weather cannot take off'
  end

  it 'wont take off if already taken off' do
    airport = Airport.new
    airport.weather = 'sunny'
    plane = Plane.new
    plane.take_off(airport)
    expect{plane.take_off(airport)}.to raise_error 'plane already taken off'
  end

  it 'can land' do
    airport = Airport.new
    airport.weather = 'sunny'
    expect(subject.land(airport)).to eq 'landed'
  end

  it 'can provide confirmation that it has landed' do
    airport = Airport.new
    airport.weather = 'sunny'
    subject.land(airport)
    expect(subject.status).to eq 'landed'
  end

  it 'wont land if weather is stormy' do
    airport = Airport.new
    airport.weather = 'stormy'
    expect{subject.land(airport)}.to raise_error 'stormy weather cannot land'
  end

  it 'wont land if the airport is full' do
    airport = Airport.new
    airport.capacity.times {Plane.new.land(airport)}
    expect{subject.land(airport)}.to raise_error 'airport is full cannot land'
  end

  it 'wont take off if already taken off' do
    airport = Airport.new
    airport.weather = 'sunny'
    plane = Plane.new
    plane.land(airport)
    expect{plane.land(airport)}.to raise_error 'plane already landed'
  end
end
