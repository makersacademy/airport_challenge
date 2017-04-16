require 'airport'
require 'plane'

RSpec.describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :take_off }

  describe '#land' do
    it 'instructs a plane to land' do
      expect(plane).to receive(:land)
      subject.land(plane)
    end
  end

  it 'confirms the plane is in the airport' do
    expect(plane).to receive(:land)
    airport.land(plane)
    expect(airport.planes).to include plane
  end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      allow(plane).to receive(:land)
      expect(plane).to receive(:take_off)
      airport.take_off(plane)
    end
  end

  it 'confirms the plane is not in the airport' do
    allow(plane).to receive(:land)
    allow(plane).to receive(:take_off)
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.planes).not_to include plane
  end
end
