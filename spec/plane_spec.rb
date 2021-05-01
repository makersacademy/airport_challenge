require './lib/airport.rb'
describe Plane do
  describe '#flying' do
    it 'responds to flying' do
      expect(subject).to respond_to(:flying)
    end
    it 'returns true when flying' do
      airport = Airport.new
      airport.land(subject)
      airport.take_off(subject)
      expect(subject.flying).to eq(true)
    end
    it 'returns false when not flying' do
      expect(subject.flying).to eq(false)
    end
  end
end