require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'lands a plane' do
      expect(subject.land(plane)).to include plane
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off) }

    it 'instructs a plane to take off' do
      expect(subject).to receive(:stormy?).and_return(false)
      expect(subject.take_off).to_not include plane
    end

    it 'raises an error if weather is stormy' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off }.to raise_error 'cannot take off due to stormy conditions'
    end
  end
end
