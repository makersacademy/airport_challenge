require 'plane'


describe Plane do
  let(:airport) { double(:airport) }
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:landed?) }
  it { is_expected.to respond_to(:take_off) }


  describe '#landed?' do
    context 'plane can confirm if it has landed or taken off/flying' do
      it 'confirms landed' do
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
    end
  end

  describe '#take_off' do
    context 'plane can take off from airport' do
      it 'takes off' do
        expect(subject.take_off).to eq true
      end
    end
  end

 #I want to prevent takeoff when weather is stormy

end
























# :001 > plan.land(airport)
#
# 2.2.3 :003 > plan.landed?
