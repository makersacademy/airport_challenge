require 'airport'
require 'plane'

describe Airport do
  @airport = Airport.new
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'raises an error when stormy' do
    @airport = Airport.new
    @planes = Plane.new
    expect(@planes.full?).to raise_error('Airport is full')
  end
end
