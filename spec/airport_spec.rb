require_relative '../lib/airport'
require_relative '../lib/plane'

describe Airport do

  it 'stores a landed plane' do
    plane = Plane.new
    subject.landing(plane)
    expect(subject.planes).to eq ([plane])
  end

  it 'prevents landing when airport is full' do
    plane = Plane.new
    subject.landing(plane)
    expect{subject.landing Plane.new}.to raise_error 'The airport is full.'
  end

  it 'allows capacity to be set' do
    airport = Airport.new(5)
    expect(airport.capacity).to eq(5)
  end

  it 'set default capacity to 3' do
    airport = Airport.new
    expect(airport.capacity).to eq(3)
  end

end
