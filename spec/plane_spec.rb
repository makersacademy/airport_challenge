require 'plane'

describe Plane do
  let(:airport) { double("airport", :receive => nil)}
  it { is_expected.to respond_to(:land) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff) }

  describe '#land' do
    it 'messages airport to receive it' do
      expect(airport).to receive(:receive).with(subject)
      subject.land(airport)
    end
  end
end
