require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { instance_double('Plane') }
  
  it "has a default capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe "accept_plane" do
    it { is_expected.to respond_to(:accept_plane).with(1).argument }
 
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
end
