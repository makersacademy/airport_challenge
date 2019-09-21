require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

describe '#land' do
  it 'when it lands it is landed and it is no longer in flight' do
    plane.land
    expect(plane).to be_landed
    expect(plane).not_to be_in_flight
  end
end

describe '#take_off' do
  it 'when it takes off it is not landed and it is in flight' do
    plane.land
    plane.take_off
    expect(plane).not_to be_landed
    expect(plane).to be_in_flight
  end
end

end