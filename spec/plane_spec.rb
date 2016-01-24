require 'plane'

describe Plane do
  let(:weather) { double :weather }

  describe '#status' do
    before do
      @airport = Airport.new
      allow(@airport.weather).to receive(:stormy?).and_return false
      @airport.land subject
    end

    it 'shows status of landed plane to be arrived' do
      expect(subject.status).to eq :arrive
    end

    it 'shows status of taken off plane to be departed' do
      @airport.takeoff subject
      expect(subject.status).to eq :depart
    end
  end
end