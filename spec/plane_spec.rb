require 'plane'

describe Plane do

  it { should respond_to(:takeoff).with(1).argument }

  it { should respond_to(:land).with(2).arguments }

  it { should respond_to(:in_airport?) }

  it "should store a plane at a specified airport when landed" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.land(airport, weather)

    expect(airport.docked_planes).to include(subject)
  end

  it "should notify air traffic control that it has left an airport" do
    weather = Weather.new
    airport = Airport.new
    allow(weather).to receive(:stormy?) { false }

    subject.land(airport,weather)
  
    expect{subject.takeoff(weather)}.to output("#{subject} has departed from #{airport}.\n").to_stdout
  end

  it "should update the planes location to 'in-flight' after takeoff" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.land(airport, weather)
    subject.takeoff(weather)

    expect(subject.location).to eq "In-flight"
  end

  it "should raise an error if told to land at a full airport" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }
   
    Airport::DEFAULT_CAPACITY.times { Plane.new.land(airport, weather) }

    expect{ subject.land(airport, weather) }.to raise_error "Cannot land at a full airport."
  end

  it "should store the plane location as an instance variable when it lands" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.land(airport, weather)

    expect(subject.location).to eq airport
  end

  it "should remove a plane from airport array when it takes off" do
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.land(airport, weather)
    subject.takeoff(weather)

    expect(airport.docked_planes).to be_empty
  end

  it "cannot take off if already in-flight" do
    weather = Weather.new

    allow(weather).to receive(:stormy?) { false }
    subject.land(Airport.new, weather)
    subject.takeoff(weather)

    expect{ subject.takeoff(weather) }.to raise_error "The plane is already in the air."
  end

  it "cannot land if it is already at an airport" do
    weather = Weather.new
    allow(weather).to receive(:stormy?) { false }

    subject.land(Airport.new, weather)

    expect { subject.land(Airport.new, weather) }.to raise_error "The plane is already docked at an airport."
  end

  it "should raise an error when trying to take off in stormy weather" do
    plane = Plane.new
    airport = Airport.new
    weather = Weather.new

    allow(weather).to receive(:stormy?) { false }
    plane.land(airport, weather)
    allow(weather).to receive(:stormy?) { true }
    
    expect{plane.takeoff(weather)}.to raise_error "The weather is too stormy to take off at the moment."
  end

  it "should raise an error when trying to land in stormy weather" do
    plane = Plane.new
    airport = Airport.new
    weather = Weather.new
    allow(weather).to receive(:stormy?) { true }
    
    expect{plane.land(airport, weather)}.to raise_error "The weather is too stormy to land at the moment."
  end

end
