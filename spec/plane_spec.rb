require 'plane'

describe Plane do
  let(:airport) { double("airport", receive: nil, release: nil) }

  describe '#land' do
    it 'messages airport to receive it' do
      expect(airport).to receive(:receive).with(subject)
      subject.land(airport)
    end

    it 'raises an error if plane has already landed' do 
      allow(WeatherService).to receive(:alert?) { false }
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("Already Landed")
    end
  end

  describe '#takeoff' do
    it 'messages airport to release it' do
      subject.land(airport)
      expect(airport).to receive(:release).with(subject)
      subject.takeoff
    end

    it 'raises an error if the plane is already in flight' do 
      expect { subject.takeoff }.to raise_error("Cannot Takeoff From The Sky")
    end
  end
end
