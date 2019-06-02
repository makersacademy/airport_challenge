require 'plane'
require 'airport'

describe Plane do
  before(:each) do
    @airport = Airport.new
    allow(@airport).to receive(:weather) { "sunny" }
  end

  it 'knows it is flying after take off' do
    plane = Plane.new(true)
    @airport.land(plane)
    @airport.take_off(plane)
    expect(plane.airborne).to eq(true)
  end
  it 'knows it is not flying after landing' do
    subject.airborne = true
    @airport.land(subject)
    expect(subject.airborne).to eq(false)
  end
end
