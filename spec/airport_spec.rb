require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { instance_double('Plane') }
  
  describe '@capacity' do
    it 'capacity cannot be less than planes in the airport' do
      5.times { subject.add_plane plane }
      expect { subject.change_capacity 4 }.to raise_error 'Cannot accommodate all planes'
    end

    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "allows setting custom capacity" do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.change_capacity 70
      expect { 70.times { subject.accept_plane plane } }.to_not raise_error
    end    
  end

  describe "accept_plane" do
    it { is_expected.to respond_to(:accept_plane).with(1).argument }
 
    it 'throws an error if the airport is full' do
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.accept_plane plane }.to raise_error 'Airport full'
    end

    it 'throws an error if weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.accept_plane plane }.to raise_error 'No landing- stormy weather!'
    end
    
    it 'accepts a plane if weather is not stormy' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.accept_plane plane
      expect(subject.planes).to include plane
    end
  end
  
  describe "release_plane" do
    it { is_expected.to respond_to(:release_plane).with(1).argument }

    it 'throws an error if plane not found in the airport' do
      allow(subject).to receive(:plane_here?).and_return(false)
      expect { subject.release_plane plane }.to raise_error 'Plane not found!'
    end
    
    it 'throws an error if weather is stormy' do
      allow(subject).to receive(:plane_here?).and_return(true)
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.release_plane plane }.to raise_error 'No taking off- stormy weather!'
    end

    it 'allows a plane to take off from airport if weather is not stormy' do
      allow(subject).to receive(:stormy?).and_return(false)
      subject.accept_plane plane
      subject.release_plane plane
      expect(subject.planes).not_to include plane
    end
  end 
  
  describe '#add_plane' do
    it 'allows a newly generated plane to be added to an available airport' do
      subject.add_plane plane
      expect(subject.planes).to include plane
    end
  end

  describe '#stormy?' do
    it 'returns true when the random number equals 1' do
      allow(Kernel).to receive(:rand).with(2).and_return(1)
      expect(subject.stormy?).to eq true
    end

    it 'returns false when the random number equals 0' do
      allow(Kernel).to receive(:rand).with(2).and_return(0)
      expect(subject.stormy?).to eq false
    end
  end
end
