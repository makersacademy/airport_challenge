require 'airport'
require 'weather'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  context 'taking off and landing' do
    it 'can land a plane' do
      airport.land(plane)
      expect(airport.planes).to eq [plane]
    end
  end

  describe 'plane must have permission to land' do
    it 'airport denines landing' do
      expect(Weather.sunny).to eq false
    end
  end
end
