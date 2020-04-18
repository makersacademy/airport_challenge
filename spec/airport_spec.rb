require './lib/plane'
require './lib/airport'

describe Airport do

  it 'prevents landing' do
    Airport::DEFAULT_CAPACITY.times { Plane.new.land_at_airport(subject) }
    expect{Plane.new.land_at_airport(subject)}.to raise_error("Airport is full")
  end

  it 'allows to override default capacity' do
    subject.capacity = Airport::DEFAULT_CAPACITY + 1
    expect(subject.capacity > Airport::DEFAULT_CAPACITY).to eq(true)
  end

end
