require 'plane'
describe Plane do
  subject(:plane) { described_class.new }
  let(:airport) { double(:airport) }
  before(:each) { subject.land airport }

  describe '#land' do
    context 'when already landed' do
      it 'prevents landing' do
        message = "#{subject} already landed"
        expect{ subject.land(airport) }.to raise_error message
      end
    end

    it 'confirms that it has landed' do
      expect(subject.landed).to be true
    end

    it 'knows which airport' do
      expect(subject.airport).to eq airport.object_id
    end
  end

  describe '#take_off' do
    context 'when not at airport' do
      it 'prevents take_off' do
        airport2 = double(:airport2)
        message = "#{subject} not at #{airport2}"
        expect{ subject.take_off(airport2) }.to raise_error message
      end
    end

    before(:each) { subject.take_off airport }
    it 'confirms that it is no longer in the airport' do
      expect(subject.landed).to be false
    end

    it 'knows it is not at airport' do
      expect(subject.airport).to be_nil
    end
  end
end
