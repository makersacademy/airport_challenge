require 'airport'

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  describe 'landing planes' do
    it 'has the plane after it has landed' do
      allow(:airport).to receive(:land)
      airpot.land(plane)
    end

    it 'has plane landed at airport' do
      subject.land(plane)
      allow(airport.arrival).to receive(:planes).and_return "#{plane}"
    end
  end
end
