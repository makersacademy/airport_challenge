require 'plane'

describe Plane do

  # When we create a new plane, it should be "flying"

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  # I would like to land my plane at the appropriate airport

  it 'can be landed at an airport' do
    expect(subject).to respond_to(:land_at).with(1).argument
  end

  # When we land a plane at the airport, it should be "landed"

  it 'is landed at an airport after landing' do
    airport = double :airport
    subject.land_at(airport)
    expect(subject).to be_landed_at(airport)
  end

  # I would like to be able to take off from the appropriate airport

  it 'can take off from an airport' do
    expect(subject).to respond_to(:take_off_from).with(1).argument
  end

  # When the plane takes of from the airport, it should be "flying" again

  it 'is flying after take off' do
    airport = double :airport
    subject.land_at(airport)
    subject.take_off_from(airport)
    expect(subject).to be_flying
  end

end

# Think about your implementation - does it allow a plane to be "flying"
# and landed? Are you testing that?

# >> I'm not testing that, but as it happens the way I've implemented
# >> 'flying?' and 'landed_at?' makes them mutually exclusive.
