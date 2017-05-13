require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

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
    plane.take_off
    plane.land
    expect(plane).to be_in_airport
  end

end
