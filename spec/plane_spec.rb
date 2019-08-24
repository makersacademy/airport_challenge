require './lib/plane'

describe Plane do
  let(:airport) { double('Airport', :take_off => nil) }

  describe '#land' do
    it 'lands a plane at an airport' do
      subject.land(at: airport)
      expect(subject.airport).not_to be_nil
    end
  end

  describe '#has_taken_off' do
    it 'checks whether a plane has taken off' do
      subject.land(at: airport)
      expect(subject.taken_off?).to eq false
    end
  end

  describe '#take_off' do
    it 'cannot take off if not landed' do
      expect { subject.take_off }.to raise_error Plane::NotLanded
    end

    it 'takes off' do
      subject.land(at: airport)
      subject.take_off
      expect(subject.taken_off?).to eq true
    end

    it 'take off notifies airport' do
      subject.land(at: airport)
      expect(airport).to receive(:take_off).with(subject)
      subject.take_off
    end
  end
end