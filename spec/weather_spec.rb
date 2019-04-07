require 'weather'

describe Weather do
  it "return 'sunny' when rand is 1" do
    allow(subject).to receive(:rand) { 1 }
    expect(subject.randomiser).to eq "sunny"
  end
  it "generates random weather. Return 'stormy' when rand is 8" do
    allow(subject).to receive(:rand) { 8 }
    expect(subject.randomiser).to eq "stormy"
  end
  it "prevents take_off when weather is stormy" do
    plane = Plane.new
    airport = Airport.new
    allow(subject).to receive(:rand) { 8 }
    p forecast = subject.randomiser
    expect(airport.take_off(plane, forecast)).to eq "Takeoff prevented due to stormy weather"
  end
end
