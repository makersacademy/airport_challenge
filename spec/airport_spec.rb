require 'airport'

describe Airport do 

  let(:flying_plane) { double :plane, flying?: true }
  let(:landed_plane) { double :plane, flying?: false }
  let(:weather)      { double :weather, stormy?: false}

  describe 'launches planes' do 
    it 'responds to launch' do 
      expect(subject).to respond_to(:launch).with(1).argument 
    end

    it 'launches a plane that flies' do 
      expect(flying_plane).to be_flying
    end

    it 'raises an error when the airport is empty' do 
      expect { subject.launch(flying_plane) }.to raise_error('No planes for take off.')
    end

    it 'raises an error when the weather is stormy' do 
      allow(subject).to receive(:stormy?).and_return true 
      expect{ subject.launch(landed_plane) }.to raise_error 'Unable to takeoff in stormy weather.'
    end
  end

  describe 'lands planes' do 
    it 'responds to land plane' do 
      expect(subject).to respond_to(:land).with(1).argument 
    end

    it 'lands a plane' do 
      expect(subject.land(flying_plane)).to eq [flying_plane] 
    end

    it 'responds to plane' do 
      expect(subject).to respond_to(:planes)
    end

    it 'raises an error when the airport is full' do 
      subject.capacity.times { subject.land(flying_plane) }
      expect { subject.land(flying_plane) }.to raise_error('Airport is full.')
    end

    it 'raises an error when the weather is stormy' do 
      allow(subject).to receive(:stormy?).and_return true 
      expect{ subject.land(flying_plane) }.to raise_error 'Unable to land in stormy weather.'
    end

  describe 'has a default or variable plane capacity' do 
    it 'has a default capacity when no explicit capacity is defined' do 
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  end

end