require 'plane'

describe Plane do

  let(:airport) { double :airport }

  it "makes planes on the ground" do
    expect(subject.location).to eq("The Factory")
  end

  it "can set @location to 'Airborn' while in flight" do
    expect(subject.airborn).to eq("Airborn")
  end

  it "can set @location to specific airport" do
    expect(subject.grounded(airport)).to eq(airport)
  end

  it "instances know where they are" do
    plane = Plane.new

    expect(plane.location).to eq("The Factory")

    allow(airport).to receive(:takeoff).and_return(plane.airborn)

    airport.takeoff(plane)
    expect(plane.location).to eq("Airborn")

    allow(airport).to receive(:land).and_return(plane.grounded(airport))

    airport.land(plane)
    expect(plane.location).to eq(airport)
  end

end
