require_relative '../lib/plane.rb'

describe Plane do

  it 'lands at an airport.' do
    airport = Airport.new
    expect(subject.lands_at(airport)).to eq subject.location
  end
end
