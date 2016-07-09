require 'plane'

describe Plane do

  it 'can take off' do
    airport = Airport.new
    expect(subject.take_off(airport)).to eq 'plane has taken off'
  end

  it 'can provide confirmation that it has taken off' do
    airport = Airport.new
    subject.take_off(airport)
    expect(subject.status).to eq 'plane has taken off'
  end

  it 'wont take off if weather is stormy' do
    airport = Airport.new
    airport.weather = 'stormy'
    expect{subject.take_off(airport)}.to raise_error 'stormy weather cannot take off'
  end

  it 'can land' do
    airport = Airport.new
    expect(subject.land(airport)).to eq 'plane has landed'
  end

  it 'can provide confirmation that it has landed' do
    airport = Airport.new
    subject.land(airport)
    expect(subject.status).to eq 'plane has landed'
  end

  it 'wont land if weather is stormy' do
    airport = Airport.new
    airport.weather = 'stormy'
    expect{subject.land(airport)}.to raise_error 'stormy weather cannot land'
  end

  it 'wont land if the airport is full' do
    airport = Airport.new(capacity)
    capacity.times.subject.land(airport)
    expect{subject.land(airport)}.to raise_error 'airport is full cannot land'
  end
end
