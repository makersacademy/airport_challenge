require 'plane'

RSpec.describe Plane do

  it "lands at an airport" do
    Airport.any_instance.stub(:stormy?) { false }
    Airport.any_instance.stub(:full?) { false }
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    expect(airport.landed_planes.include?(plane)).to eq true
  end

  it "takes off from an airport and confirms" do
    Airport.any_instance.stub(:stormy?) { false }
    Airport.any_instance.stub(:full?) { false }
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    expect(plane.take_off(airport)).to be_a(String)
    expect(airport.landed_planes.include?(plane)).to eq false
  end

  it "does not land if airport is full" do
    Airport.any_instance.stub(:stormy?) { false }
    airport = Airport.new(1)
    plane1 = Plane.new
    plane2 = Plane.new
    plane1.land(airport)
    message = 'Airport is full.'
    expect { plane2.land(airport) }.to raise_error(RuntimeError, message)
  end

  it "does not land if airport is stormy" do
    Airport.any_instance.stub(:stormy?) { true }
    airport = Airport.new
    plane = Plane.new
    message = 'Weather is stormy. Cannot land.'
    expect { plane.land(airport) }.to raise_error(RuntimeError, message)
  end

  it "does not take off if airport is stormy" do
    Airport.any_instance.stub(:stormy?) { false }
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    Airport.any_instance.stub(:stormy?) { true }
    message = 'Weather is stormy. Cannot take off.'
    expect { plane.take_off(airport) }.to raise_error(RuntimeError, message)
  end

  it "does not take off if already flying" do
    plane = Plane.new
    airport = Airport.new
    message = 'This plane is already flying.'
    expect { plane.take_off(airport) }.to raise_error(RuntimeError, message)
  end

  it "does not take off if not at the specified airport" do
    plane = Plane.new
    airport1 = Airport.new
    airport2 = Airport.new
    plane.land(airport1)
    message = 'This plane is not at the specified airport.'
    expect { plane.take_off(airport2) }.to raise_error(RuntimeError, message)
  end

  it "does not land if already landed" do
    plane = Plane.new
    airport1 = Airport.new
    airport2 = Airport.new
    plane.land(airport1)
    message = "Plane has already landed at #{airport1}."
    expect { plane.land(airport2) }.to raise_error(RuntimeError, message)
  end

end
