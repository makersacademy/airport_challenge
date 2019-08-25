require 'airport'

describe Airport do
  let(:plane) { double :plane }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    it 'raises an error when no plane at airport' do
      expect { subject.take_off }.to raise_error 'No plane at airport'
    end
  end

  describe '#land' do
    it 'raises an error when airport is full' do
      subject.capacity.times do
        subject.land(plane)
      end
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end

    #it 'raises an error when weather is stormy' do

  end

end
