require 'plane'

describe Plane do
  let(:stormy) { double(:weather, stormy?: true) }
  let(:sunny) { double(:weather, stormy?: false) }
  let(:airport_full) { double(:airport, full?: true) }
  let(:airport) { double(:airport, full?: false) }

  it 'lands plane at an airport' do
    plane = Plane.new(sunny, airport)
    plane.land
    expect(plane.landed?).to be true
  end

  it 'takes off from an airport' do
    plane = Plane.new(sunny, airport)
    plane.take_off(sunny)
    expect(plane.taken_off?).to be true
  end

  it 'prevents take off when weather is stormy' do
    plane = Plane.new(stormy, airport)
    plane.take_off(stormy)
    expect(plane.taken_off?).to be false
  end

  it 'prevents landing when weather is stormy' do
    plane = Plane.new(stormy, airport)
    plane.land
    expect(plane.landed?).to be false
  end

  it 'prevents landing when airport is full' do
    plane = Plane.new(sunny, airport_full)
    plane.land
    expect(plane.landed?).to be false
  end
  
end