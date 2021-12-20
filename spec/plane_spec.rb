require 'plane'

describe Plane do
  # Initialisaiton and method behaviour

  it "should be assigned an location upon creation" do
    expect(subject.location).to_not be nil
  end

  it "should be initialized in an airport location" do
    airport = Airport.new

    expect(subject.location.class).to be Airport
  end

end

describe Plane do
  # Landing behaviours

  it "should store a plane at a specified airport when landed" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.takeoff(weather)
    subject.land(airport, weather)

    expect(airport.docked_planes).to include(subject)
  end

  it "should store the plane location as an instance variable when it lands" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.takeoff(weather)
    subject.land(airport, weather)

    expect(subject.location).to eq airport
  end

  it "cannot land if it is already at an airport" do
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }
    message = "The plane is already docked at an airport."

    subject.takeoff(weather)
    subject.land(Airport.new, weather)

    expect { subject.land(Airport.new, weather) }.to raise_error message
  end

  it "should raise an error if told to land at a full airport" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }
    message = "Cannot land at a full airport."
   
    Airport::DEFAULT_CAPACITY.times { 
      plane = Plane.new
      plane.takeoff(weather)
      plane.land(airport, weather) 
    }

    expect { subject.land(airport, weather) }.to raise_error message
  end

end

describe Plane do
  # Take off behaviours

  it "should notify air traffic control that it has left an airport" do
    weather = Weather.new
    airport = Airport.new
    allow(weather).to receive(:stormy?) { false }
    message = "#{subject} has departed from #{airport}.\n"
    
    subject.takeoff(weather)
    subject.land(airport,weather)
  
    expect { subject.takeoff(weather) }.to output(message).to_stdout
  end

  it "should update the planes location to 'in-flight' after takeoff" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.takeoff(weather)

    expect(subject.location).to eq "In-flight"
  end

  it "should remove a plane from airport array when it takes off" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.takeoff(weather)

    expect(airport.docked_planes).to be_empty
  end

  it "cannot take off if already in-flight" do
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }
    message = "The plane is already in the air."

    subject.takeoff(weather)

    expect { subject.takeoff(weather) }.to raise_error message
  end
end

context Plane do
  # When stormy

  it "should raise an error when trying to take off in stormy weather" do
    plane = Plane.new
    airport = Airport.new
    weather = Weather.new
    message = "The weather is too stormy to take off at the moment."

    allow(weather).to receive(:stormy?) { true }
    
    expect { plane.takeoff(weather) }.to raise_error message
  end

  it "should raise an error when trying to land in stormy weather" do
    plane = Plane.new
    airport = Airport.new
    weather = Weather.new
    message = "The weather is too stormy to land at the moment."
    allow(weather).to receive(:stormy?) { false }
    plane.takeoff(weather)
    allow(weather).to receive(:stormy?) { true }

    
    expect { plane.land(airport, weather) }.to raise_error message
  end

end
