require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe '#land' do
    it 'lands a plane' do
      expect(subject).to receive(:stormy?).and_return(false)
      expect(subject.land(plane)).to include plane
    end

    it 'does not land and raises an error if weather is stormy' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'cannot land due to stormy conditions'
    end

    it 'prevents landing when airport is full' do
      expect(subject).to receive(:stormy?).and_return(false)
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'cannot land as the airport is full'
    end
  end

  describe '#take_off' do

    it 'instructs a plane to take off' do
      expect(subject).to receive(:stormy?).and_return(false)
      expect(subject.take_off).to_not include plane
    end

    it 'does not take off and raises an error if weather is stormy' do
      expect(subject).to receive(:stormy?).and_return(true)
      expect { subject.take_off }.to raise_error 'cannot take off due to stormy conditions'
    end
  end
end
