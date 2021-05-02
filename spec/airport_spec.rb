require 'airport'

describe Airport do
  it 'instantiates with a default capacity value of 4' do
    default_airport = Airport.new
    expect(default_airport.capacity).to eq 4
  end

  it 'can be instantiated with an overriden capacity value' do
    sixer_airport = Airport.new(6)
    expect(sixer_airport.capacity).to eq 6
  end

  it 'knows it starts with 0 planes on the ground' do
    expect(subject.planes_in_port.size).to eq 0
  end

  it 'increases planes_in_port by 1 when a plane lands' do
    expect(subject.plane_arrives.planes_in_port.size).to eq 1
  end

  # test to see whether planes on ground decreases by 1 when a plane takesoff
end
