require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) {double :airport}

  it 'should confirm that it is no longer in the airport' do
    allow(airport).to receive(:try_allow_take_off).with(plane)
    plane.take_off(airport)
    expect(plane).not_to be_in_airport
  end

  it 'should confirm that it has landed' do
    allow(airport).to receive(:full?).and_return false
    allow(airport).to receive(:try_allow_land).with(plane)
    plane.instance_variable_set(:@in_airport, false)
    plane.land(airport)
    expect(plane).to be_in_airport
  end

end
