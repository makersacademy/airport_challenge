require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  before do
    allow(plane).to receive(:land)
  end

  context 'can do simple landings (Story 01):' do

    it 'it instructs a plane to land' do
      expect(plane).to receive(:land)
      subject.land plane
      plane.land
    end

    it 'holds the actual plane after landing' do
      airport.land(plane)
      expect(subject.planes).to eq plane
    end

  end

end
