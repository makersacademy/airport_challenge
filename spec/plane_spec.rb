# require 'plane'

describe Plane do
  describe '#landed' do
    it 'responds to "#landed"' do
      expect(subject).to respond_to(:landed?)
    end

    it 'confirms that a plane has landed' do
      expect(subject.landed?).to eq true
    end

    context 'when has not landed' do
      it 'raises an error' do
        expect { subject.landed? }.to raise_error 'Plane has not landed yet!'
      end
    end
  end
end
