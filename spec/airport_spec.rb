require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  context 'can do landings:' do
    it 'such as a simple landing' do
      allow(plane).to receive(:land)
      airport.land(plane)
      expect(subject.planes).to eq plane
    end



  end



end
