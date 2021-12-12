require 'plane'

describe Plane do
  let(:airport) { double("airport", :receive => nil, :release => nil)}

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff) }

  describe '#land' do
    it 'messages airport to receive it' do
      expect(airport).to receive(:receive).with(subject)
      subject.land(airport)
    end
  end

  describe '#takeoff' do
    before do
      subject.land(airport)
    end
    it 'messages airport to release it' do
      expect(airport).to receive(:release).with(subject)
      subject.takeoff
    end
  end
end
