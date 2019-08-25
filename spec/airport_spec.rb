require 'airport'

describe Airport do
  let(:plane) { double :plane }

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'initialization' do
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.land double(:plane)
      end
      expect { subject.land double(:plane) }.to raise_error 'Airport full'
    end
  end

  describe '#take_off' do
    it 'raises an error when plane not in the airport' do
      expect { subject.take_off(plane) }.to raise_error 'Plane not in this airport'
    end

    # it 'confirms after a plane takes off' do
    #   plane = double(:plane)
    #   subject.land(plane)
    #   allow(plane).to receive_message_chain(:taken_off, flying?: true)
    #   subject.take_off(plane)
      
    # end
  end

  describe '#land' do
    it 'raises an error when airport is full' do
      subject.capacity.times do
        subject.land double(:plane)
      end
      expect { subject.land double(:plane) }.to raise_error 'Airport full'
    end

    it 'raises an error when plane already landed' do
      plane = double(:plane)
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Plane already landed'
    end

    # it 'raises an error when weather is stormy' do

  end

end
