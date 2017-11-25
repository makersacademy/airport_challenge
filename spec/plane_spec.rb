require 'plane'

describe Plane do
  let(:airport) { double(:airport, receive: nil) }
  describe '#land' do
    it 'Can land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'can not land when grounded' do
      expect { subject.land(airport) }.to raise_error(RuntimeError, "Already grounded")
    end
    it 'lands at the correct airport' do
      subject.takeoff
      subject.land(airport)
      expect(subject.airport).to eq airport
    end
  end
  describe '#takeoff' do
    it 'Can takeoff' do
      subject.takeoff
      expect(subject.grounded).to be false
    end
    it 'can not takeoff when flying' do
      subject.takeoff
      expect { subject.takeoff }.to raise_error(RuntimeError, "Already flying")
    end
  end
end
