require './lib/plane'
require './lib/airport'

describe Airport do

  it 'prevents landing' do
    Airport::DEFAULT_CAPACITY.times { Plane.new.land_at_airport(subject) }
    expect{Plane.new.land_at_airport(subject)}.to raise_error("Airport is full")
  end
end
