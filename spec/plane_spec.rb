require 'plane'

describe Plane do
  airport = Airport.new
  it "returns true if has landed" do
    allow(airport).to receive(:stormy?) { false }
    airport.land(subject)
    expect(subject.landed?).to eq(true)
  end

  it "returns false if has taken off" do
    allow(airport).to receive(:stormy?) { false }
    airport.take_off(subject)
    expect(subject.landed?).to eq(false) 
  end

end
