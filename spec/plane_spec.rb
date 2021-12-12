require 'plane'

describe Plane do
  let(:airport) { double("airport", :receive => nil, :release => nil) }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff) }

  describe '#land' do
    it 'messages airport to receive it' do
      expect(airport).to receive(:receive).with(subject)
      subject.land(airport)
    end
  end

  describe '#takeoff' do
    it 'messages airport to release it' do
      subject.land(airport)
      expect(airport).to receive(:release).with(subject)
      subject.takeoff
    end

    it 'raises an error if the plane is already in flight' do 
      subject.takeoff
      expect { subject.takeoff }.to raise_error("Cannot Takeoff From The Sky")
    end
  end
end
