require 'plane'
require 'airport'
require 'weather'

describe Plane do

  subject(:Plane) {described_class.new}
  let(:airport) {double :airport}

  it 'it knows it has landed' do
    # airport = Airport.new(weather)
    #allow(weather).to receive(:stormy?).and_return false
    # plane = Plane.new
    allow(airport).to receive(:land)
    airport.land(subject)
    expect(subject.landed?).to eq false
  end

  it 'it knows it is in the air' do
    # plane = Plane.new
    expect(subject.in_air?).to eq true
  end
end
