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
      expect(subject).to receive(:rand).and_return(3)
      expect(subject.take_off).to_not include plane
    end

    it 'raises an error if weather is stormy' do
      expect(subject).to receive(:rand).and_return(9)
      expect { subject.take_off }.to raise_error 'cannot take off due to stormy conditions'
    end
  end
end
