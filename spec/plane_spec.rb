require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) {double :airport}

  it 'should confirm that it is no longer in the airport' do
    plane.take_off
    expect(plane).not_to be_in_airport
  end

  it 'should confirm that it has landed' do
    allow(airport).to receive(:full?).and_return false
    allow(airport).to receive(:land).with(plane)
    plane.take_off
    plane.land(airport)
    expect(plane).to be_in_airport
  end

  it 'should raise an exception when trying to land a plane at a full airport' do
    allow(airport).to receive(:full?).and_return true
    allow(airport).to receive(:land).with(plane)
    expect{ plane.land(airport) }.to raise_error "Unable to land - airport full"
  end

  it 'should raise an exception when trying to take off from an airport it is not at' do
      allow(airport).to receive(:planes).and_return []
      expect{ plane.take_off(airport) }.to raise_error "Plane is not at that airport"
  end
end
