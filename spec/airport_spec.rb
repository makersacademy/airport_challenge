require 'airport'
require 'plane'

describe Airport do
  let(:plane) { double :plane }

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'raises an error when airport full' do
      allow(subject).to receive(:storm?).and_return(false)
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'Airport full'
    end

    it 'does not raise an error when airport available' do
      allow(subject).to receive(:storm?).and_return(false)
      allow(subject).to receive(:full?).and_return(false)
      expect { subject.land(plane) }.not_to raise_error
    end

    it 'raises an error when bad weather' do
      allow(subject).to receive(:full?).and_return(false)
      allow(subject).to receive(:storm?).and_return(true)
      expect { subject.land(plane) }.to raise_error 'Not able to land due to storm'
    end

    it 'does not raise error when good weather' do
      allow(subject).to receive(:full?).and_return(false)
      allow(subject).to receive(:storm?).and_return(false)
      expect { subject.land(plane) }.not_to raise_error
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(1).argument }

    it 'raises an error when no planes at airport to take_off' do
      # allow(subject).to receive(:storm?).and_return(false)
      allow(subject).to receive(:empty?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error 'No planes available'
    end 
  
    it 'does not raise an error when planes at airport to take_off' do
      allow(subject).to receive(:storm?).and_return(false)
      allow(subject).to receive(:empty?).and_return(false)
      expect { subject.take_off(plane) }.not_to raise_error
    end 
  
    it 'raises an error when bad weather for take off' do
      allow(subject).to receive(:empty?).and_return(false)
      allow(subject).to receive(:storm?).and_return(true)
      expect { subject.take_off(plane) }.to raise_error 'Not able to take off due to storm'
    end

  end

end
