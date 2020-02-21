require_relative '../lib/airport'
describe Plane do
  it{ is_expected.to respond_to(:flying?) }

  it "is no longer flying after landing" do
    airport = Airport.new
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(subject)
    expect(subject).not_to be_flying
  end

  it "is flying again after taking of" do
    airport = Airport.new
    allow(airport).to receive(:weather) { "sunny" }
    airport.land(subject)
    airport.take_off
    expect(subject).to be_flying
  end
end