require 'plane'
require 'airport'

describe Plane do

  # When we create a new plane, it should be "flying"

  it 'is flying when created' do
    expect(subject).to be_flying
  end

  # As a pilot
  # So that I can arrive at my specified destination
  # I would like to land my plane at the appropriate airport

  it 'can be landed at an airport' do
    expect(subject).to respond_to(:land_at).with(1).argument
  end

  # When we land a plane at the airport, the plane in question
  # should be "landed"

  it 'is landed after landing' do
    airport = Airport.new
    subject.land_at(airport)
    expect(subject).to be_landed
  end

  # As a pilot
  # So that I can set off for my specified destination
  # I would like to be able to take off from the appropriate airport

  it 'can take off from an airport' do
    expect(subject).to respond_to(:take_off_from).with(1).argument
  end

  # When the plane takes of from the airport, it should be "flying" again

  it 'is flying after take off' do
    airport = Airport.new
    subject.land_at(airport)
    subject.take_off_from(airport)
    expect(subject).to be_flying
  end

end

# Think about your implementation - does it allow a plane to be "flying"
# and landed? Are you testing that?

# >> I'm not testing that but as it happens the way I've implemented
# >> Plane.flying? and Plane.landed? makes them mutually exclusive.
