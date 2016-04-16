require 'plane'


describe Plane do
  let(:airport) { double(:airport, weather: "sunny") }
  let(:subject) {Plane.new(airport)}

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:landed?) }
  it { is_expected.to respond_to(:take_off) }

  describe '#landed?' do
    context 'plane can confirm if it has landed or taken off' do
      it 'it confirms landed' do
        subject.land(airport)
        expect(subject.landed?).to eq true
      end
      it 'confirms that it has taken off' do
        subject.take_off
        expect(subject.landed?).to eq false
      end
    end
  end

  describe '#land' do
    context 'plane can land at an airport' do
      it 'lands' do
        expect(subject.land(airport)).to eq true
      end
      it 'does not land in stormy weather' do
        allow(airport).to receive(:weather).and_return("stormy")
        expect { subject.land(airport) }.to raise_exception "Can't land in in stormy weather"
      end
    end
  end

  describe '#take_off' do
    context 'plane can take off from airport' do
      it 'it takes off' do
        expect(subject.take_off).to eq true
      end
      it 'does not take off in stormy weather' do
        allow(airport).to receive(:weather).and_return("stormy")
        expect { subject.take_off }.to raise_exception "Can't take off in stormy weather"
      end
    end
  end
end
