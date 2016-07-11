require 'airport'


describe Airport do

  describe '#plan landing' do
    it 'allows plan to land' do
      plane = double(:plane)
      expect(plane).to receive(:land)
      subject.land plane
    end
    it 'confirms the plane has landed' do
      plane = double(:plane)
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.planes).to include plane
    end
  end

  describe '#take off plane' do
    it 'allows plane to take off' do
      plane = double(:plane)
      expect(plane).to receive(:take_off)
      subject.take_off(plane)
    end
    it 'confirms the plane has taken off' do
      plane = double(:plane)
      #to test take off, we must have a landed plane first
      allow(plane).to receive(:land)
      subject.land(plane)
      #Now that we have a landed plane, we can test the take off
      allow(plane).to receive(:take_off)
      subject.take_off(plane)
      expect(subject.planes).not_to include plane
    end
  end
  describe '#full' do
    it 'raises an error when airport is full' do
      plane = double(:plane)
      allow(plane).to receive(:land)
      subject.capacity.times do
        subject.land(plane)
      end
      error_message = 'Airport is full'
      expect { subject.land(plane) }.to raise_error error_message
    end
  end
  describe 'stormy weather' do
    it 'prevents planes from taking off' do
      double(:weather, stormy?: true)
      error_message = 'Unable to take off due to bad weather'
      expect{ subject.prevent_take_off }.to raise_error error_message
    end
    it 'prevents planes from landing' do
      double(:weather, stormy?: true)
      error_message = 'Unable to land due to bad weather'
      expect { subject.prevent_landing }.to raise_error error_message
    end
  end
  describe 'clear weather' do
    it 'allows planes to land' do
      weather = double(:weather)
      plane = double(:plane)
      allow(plane).to receive(:land)
      allow(weather).to receive(:stormy?).and_return(false)
      expect { subject.land(plane) }.not_to raise_error
    end
    it 'allows planes to take off' do
      weather = double(:weather)
      plane = double(:plane)
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      subject.land(plane)
      allow(weather).to receive(:stormy?).and_return(false)
      expect{ subject.take_off(plane) }.not_to raise_error
    end
  end
end
