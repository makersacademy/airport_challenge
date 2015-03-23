require 'airport'
describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  context 'taking off and landing' do
    it 'can land a plane' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end
end
