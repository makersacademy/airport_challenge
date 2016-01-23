require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) {double(:plane)}

  it "can land a plane" do
    expect(airport).to respond_to(:land).with(1).argument
  end

  it "can have a plane take-off" do
    expect(airport).to respond_to(:take_off).with(1).argument
  end

  it "can confirm a plane is no longer in the airport" do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.docked(plane)).to eq false
  end
end