require 'airport.rb'

describe Airport do
  it 'lands plane when airport.land is called' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.hanger).to include(plane)
  end

  it 'take off plane from airport and confirm plane is not in hanger' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    airport.takeoff(plane)
    expect(airport.hanger).not_to include(plane)
  end

end
