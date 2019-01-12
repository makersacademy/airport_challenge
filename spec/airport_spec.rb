require 'airport'

RSpec.describe Airport do
  context 'when a default airport is initialised' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:take_off) }
  end
  context 'when an airport has a plane landed'
  before(:each) do
    @airport = described_class.new
    @plane = Plane.new
    @airport.land(@plane)
  end
  it { expect(@airport.current_plane).to be_a(Plane) }
  it { expect(@airport.take_off).to be @plane }
end
