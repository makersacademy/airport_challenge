require 'plane'
describe Plane do

  it 'Can receive the "land" command with 2 arguments.' do
    expect(subject).to respond_to(:land).with(2).argument
  end

  it 'Can receive the "take_off" command with 2 arguments.' do
    expect(subject).to respond_to(:take_off).with(2).argument
  end

  it 'Will not be permitted to take-off during stormy weather' do
    weather = double(:Weather, :stormy? => true)
    airport = double(:Airport)
    message = 'The weather is too stormy to take-off.'
    expect{subject.take_off(airport, weather)}.to raise_error(message)
  end

  it 'Will not be permitted to land during stormy weather.' do
    weather = double(:Weather, :stormy? => true)
    airport = double(:Airport)
    message = 'The weather is too stormy to land.'
    expect{subject.land(airport, weather)}.to raise_error(message)
  end

  it 'Will not be permitted to land when the airport is full (using default capacity).' do
    weather = double(:Weather, :stormy? => false)
    default_capacity = 30
    airport = double(:Airport, :capacity => default_capacity, :landed_planes => [])
    30.times { airport.landed_planes << String.new }
    message = 'There is no room at the airport.'
    expect{subject.land(airport, weather)}.to raise_error(message)
  end

  it 'Will not be permitted to land when the airport is full (using overridden capacity).' do
    weather = double(:Weather, :stormy? => false)
    airport = double(:Airport, :capacity => 2, :landed_planes => [:plane_1, :plane_2])
    message = 'There is no room at the airport.'
    expect{subject.land(airport, weather)}.to raise_error(message)
  end

end
