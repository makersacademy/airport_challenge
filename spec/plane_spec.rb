require 'plane'

describe Plane do
  let(:airport) { double :airport }
  describe '#land' do
    it 'Can land' do
      expect(subject).to respond_to(:land).with(1).argument
    end
    it 'can not land when grounded' do
      expect { subject.land(airport) }.to raise_error(RuntimeError, "Already grounded")
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
