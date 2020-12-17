require "airport_class.rb"

describe Airport do
  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport

  it "can land planes and put them into the hangar" do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to include plane
  end

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "can instruct a plane to take off from the airport" do
    plane = Plane.new
    subject.land_plane(plane)
    subject.take_off(plane)
    expect(subject.planes).not_to include plane
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full 

  it "does not allow a plane to land when the airport is full" do
    plane = Plane.new
    Airport::AIRPORT_CAPACITY.times {subject.land_plane(plane)}
    expect{subject.land_plane(plane)}.to raise_error "The plane cannot land as the airport is full"
  end

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  it "allows the airport capacity to be manually set" do
    plane = Plane.new
    airport = Airport.new(10)
    Airport::AIRPORT_CAPACITY.times {airport.land_plane(plane)}
    expect{airport.land_plane(plane)}.not_to raise_error "The plane cannot land as the airport is full"
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy 

  it "prevents a plane from taking off when weather is stormy" do 
    plane = Plane.new
    subject.weather = "stormy"
    expect{subject.take_off(plane)}.to raise_error "The plane cannot take off due to stormy weather"
  end

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when weather is stormy
  
  it "prevents a plane from landing when weather is stormy" do 
    plane = Plane.new
    subject.weather = "stormy"
    expect{subject.land_plane(plane)}.to raise_error "The plane cannot land due to stormy weather"
  end
end
