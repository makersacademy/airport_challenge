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

describe "landing tests" do

  before(:each) do
    @airport = Airport.new
    @weather = Weather.new
    @plane = Plane.new
  end

  it "should store a plane at a specified airport when landed" do
    allow(@weather).to receive(:stormy?) { false }

    @plane.takeoff(@weather)
    @plane.land(@airport, @weather)

    expect(@airport.docked_planes).to include(@plane)
  end

  it "should store the plane location as an instance variable when it lands" do
    allow(@weather).to receive(:stormy?) { false }

    @plane.takeoff(@weather)
    @plane.land(@airport, @weather)

    expect(@plane.location).to eq @airport
  end

  it "cannot land if it is already at an airport" do
    allow(@weather).to receive(:stormy?) { false }
    message = "The plane is already docked at an airport."

    @plane.takeoff(@weather)
    @plane.land(@airport, @weather)

    expect { @plane.land(@airport, @weather) }.to raise_error message
  end

  it "should raise an error if told to land at a full airport" do
    allow(@weather).to receive(:stormy?) { false }
    message = "Cannot land at a full airport."
   
    Airport::DEFAULT_CAPACITY.times { 
      plane = Plane.new
      plane.takeoff(@weather)
      plane.land(@airport, @weather) 
    }

    expect { @plane.land(@airport, @weather) }.to raise_error message
  end

end

describe "takeoff tests" do

  before(:each) do
    @airport = Airport.new
    @weather = Weather.new
    @plane = Plane.new
  end

  it "should notify air traffic control that it has left an airport" do
    allow(@weather).to receive(:stormy?) { false }
    message = "#{@plane} has departed from #{@airport}.\n"
    
    @plane.takeoff(@weather)
    @plane.land(@airport,@weather)
  
    expect { @plane.takeoff(@weather) }.to output(message).to_stdout
  end

  it "should update the planes location to 'in-flight' after takeoff" do
    allow(@weather).to receive(:stormy?) { false }

    @plane.takeoff(@weather)

    expect(@plane.location).to eq "In-flight"
  end

  it "should remove a plane from airport array when it takes off" do
    allow(@weather).to receive(:stormy?) { false }

    @plane.takeoff(@weather)

    expect(@airport.docked_planes).to be_empty
  end

  it "cannot take off if already in-flight" do
    allow(@weather).to receive(:stormy?) { false }
    message = "The plane is already in the air."

    @plane.takeoff(@weather)

    expect { @plane.takeoff(@weather) }.to raise_error message
  end
end

context "stormy conditions tests" do
  
  before(:each) do
    @plane = Plane.new
    @airport = Airport.new
    @weather = Weather.new 
  end

  it "should raise an error when trying to take off in stormy weather" do
    message = "The weather is too stormy to take off at the moment."

    allow(@weather).to receive(:stormy?) { true }
    
    expect { @plane.takeoff(@weather) }.to raise_error message
  end

  it "should raise an error when trying to land in stormy weather" do
    message = "The weather is too stormy to land at the moment."
    allow(@weather).to receive(:stormy?) { false }
    @plane.takeoff(@weather)
    allow(@weather).to receive(:stormy?) { true }

    
    expect { @plane.land(@airport, @weather) }.to raise_error message
  end

end
