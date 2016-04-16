require 'plane'

describe Plane do

  it 'adds a plane to the airport once it has landed' do
    airport = Airport.new
    subject.land(airport)
    expect(airport.planes).to include(subject)
  end

  it 'removes a plane once it has taken off' do
    airport = Airport.new
    subject.take_off(airport)
    expect(airport.planes).not_to include(subject)
  end

end
