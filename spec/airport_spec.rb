require_relative '../lib/airport'
require_relative '../lib/plane'

describe Airport do

  it 'allows plane to take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'instructs plane to land at airport' do
    expect(subject).to respond_to(:landing)
  end

  it 'stores a landed plane' do
    plane = Plane.new
    subject.landing(plane)
    expect(subject.planes).to eq ([plane])
  end

  it 'prevents landing when airport is full' do
    airport = Airport.new
    3.times do
      plane = Plane.new
      airport.landing(plane)
    end
    expect{airport.landing Plane.new}.to raise_error 'The airport is full.'
  end

  it 'allows capacity to be set' do
    airport = Airport.new(5)
    expect(airport.capacity).to eq(5)
  end

  it 'set default capacity to 3' do
    airport = Airport.new
    expect(airport.capacity).to eq(3)
  end

  it 'planes can only take-off from airport they are in' do
    plane = Plane.new
    expect{subject.take_off(plane)}.to raise_error 'You are not at this airport'
  end

end
