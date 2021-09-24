require 'plane'

describe Plane do
  it "Lands at Airport" do
    airport = Airport.new
    expect(subject.land(airport)).to eq true
  end

  it "Won't land if weather is stormy" do
    airport = Airport.new
    allow(airport).to receive(:weather) { "Stormy" }
    expect { subject.land }.to raise_error
  end

  it "Won't land if airport is full" do
    airport1 = Airport.new
    allow(airport1).to receive(:full?) { "full" }
    expect { plane.land(airport1) }.to raise_error
  end

  it "Takes off from airport and sends a message" do
    airport = Airport.new
    expect(subject.takeoff(airport)).to eq "Plane taken off"
  end

  it "Won't take off if weather is stormy" do
    airport = Airport.new
    allow(airport).to receive(:weather) { "Stormy" }
    expect { subject.takeoff(airport) }.to raise_error
  end

end
   