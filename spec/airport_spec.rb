require 'airport'

describe Airport do
  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it { is_expected.to respond_to(:planes) }

    it 'lands plane' do
      plane = Plane.new
      expect(subject.land(plane)).to eq 'Plane has landed'
    end
  end
  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }
    it { is_expected.to respond_to(:planes) }

    it 'plane takes off' do
      plane = Plane.new
      expect(subject.take_off(plane)).to eq 'Plane has taken off'
    end
  end
  describe 'initialization' do
    subject { Airport.new }
    let(:plane) { Plane.new }
    it 'defaults airport capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport is at full capacity.'
    end
  end
end
