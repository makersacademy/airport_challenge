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
  end 
  
end
