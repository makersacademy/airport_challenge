require 'plane'

describe Plane do
  
  airport = Airport.new
  
  before(:example) do
    allow(airport.weather).to receive(:stormy?) { false }
  end

  it "returns true if has landed" do
    airport.land(subject)
    expect(subject.landed?).to eq(true)
  end

  it "returns false if has taken off" do
    airport.take_off(subject)
    expect(subject.landed?).to eq(false) 
  end

end
