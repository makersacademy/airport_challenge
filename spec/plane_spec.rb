require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) {double :airport}

  it 'should allow user to instruct a plane to take off' do
    expect(plane).to respond_to(:take_off)
  end

  it 'should confirm that it is no longer in the airport' do
    plane.take_off
    expect(plane).not_to be_in_airport
  end

  it 'should allow user to instruct a plane to land' do
    expect(plane).to respond_to(:land)
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

end
