require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:take_off).with(1).argument }
  it "adds a plane to the airport when plane lands there" do
    plane = Plane.new
    airport = Airport.new
    expect(plane.land(airport)).to eq [plane]
  end
  it "adds two planes to the airport when plane lands there" do
    plane = Plane.new
    plane2 = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect(plane2.land(airport)).to eq [plane, plane2]
  end
  it "removes plane from airport when it takes off" do
    airport = Airport.new
    plane = Plane.new
    plane.land(airport)
    plane.take_off(airport)
    expect(airport.planes).to eq []
  end
  it "confirms that plane took off" do
    plane = Plane.new
    airport = Airport.new
    plane.land(airport)
    expect { plane.take_off(airport) }.to output("#{plane} has taken off from #{airport}.\n").to_stdout
  end
  it "raises an error and does not land when the airport is full" do
    airport = Airport.new
    airport.capacity.times { Plane.new.land(airport) }
    expect { subject.land(airport) }.to raise_error "Sorry, this airport is full"
  end
end
