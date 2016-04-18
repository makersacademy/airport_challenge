require 'airport'

describe Airport do 

  let(:plane)        { double :plane, flying?: true }
  let(:landed_plane) { double :plane, flying?: false }
  let(:weather)      { double :weather, stormy?: false}

  describe 'launches planes' do 
    it 'responds to launch' do 
      allow(plane).to receive(:flying?).and_return true
      expect(subject).to respond_to(:launch).with(1).argument 
    end

    it 'launches a plane that flies' do 
      expect(plane).to be_flying
    end

    it 'raises an error when the airport is empty' do 
      expect { subject.launch(landed_plane) }.to raise_error('No planes.')
    end

    it 'raises an error when the weather is stormy' do 
      allow(subject).to receive(:stormy?).and_return true 
      expect{ subject.launch(landed_plane) }.to raise_error 'Grounded.'
    end

    it 'raises an error when plane already flying' do 
      allow(plane).to receive(:flying?).and_return true
      expect{ subject.launch(plane) }.to raise_error 'Already in flight.'
    end
  end

  describe 'lands planes' do 
    it 'responds to land plane' do 
      allow(plane).to receive(:flying?).and_return false
      expect(subject).to respond_to(:land).with(1).argument 
    end

    it 'lands a plane' do 
      allow(plane).to receive(:flying).and_return false
      allow(plane).to receive(:landed?).and_return true
      expect(subject.land(plane)).to eq [plane] 
    end

    it 'raises an error when the airport is full' do 
      allow(plane).to receive(:landed?).and_return true
      subject.capacity.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error('Airport full.')
    end

    it 'raises an error when the weather is stormy' do 
      allow(subject).to receive(:stormy?).and_return true 
      expect{ subject.land(plane) }.to raise_error 'Cannot land.'
    end

    it 'raises an error when plane already landed' do
      allow(landed_plane).to receive(:flying?).and_return false
      expect{ subject.land(landed_plane) }.to raise_error 'Already landed.'
    end
  end

  describe 'has a default or variable plane capacity' do 
    it 'has a default capacity when no explicit capacity is defined' do 
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end
end