require 'plane'

describe Plane do

  let(:airport) { double :airport }

  it "makes planes on the ground and the Factory" do
    expect(subject.location).to eq("The Factory")
  end

  it "can set @location to 'Airborne' while in flight" do
    expect(subject.airborne).to eq("Airborne")
  end

  it "can set @location to a specific airport" do
    expect(subject.grounded(airport)).to eq(airport)
  end

  it "instances know where they are" do
    plane = Plane.new

    expect(plane.location).to eq("The Factory")

    allow(airport).to receive(:takeoff).and_return(plane.airborne)

    airport.takeoff(plane)
    expect(plane.location).to eq("Airborne")

    allow(airport).to receive(:land).and_return(plane.grounded(airport))

    airport.land(plane)
    expect(plane.location).to eq(airport)
  end

end
