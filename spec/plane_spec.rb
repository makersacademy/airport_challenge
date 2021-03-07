require 'airport'

describe Plane do
  it { is_expected.to respond_to :airborne }

  it "changes it's status to airborne = true when it takes off" do
    airport = Airport.new
    plane = Plane.new(false)
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(4)
    airport.take_off(plane)
    expect(plane.airborne).to eq true
  end

  it "changes it's status to airborne = false when it lands" do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(plane.airborne).to eq false
  end

  it { is_expected.to respond_to :airport_id }

end
