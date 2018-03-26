require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:stormy_airport) { Airport.new }
  let(:not_stormy_airport) { Airport.new }
  let(:plane) { instance_double('Plane') }

  before do
    allow(stormy_airport).to receive(:stormy?).and_return(true)
    allow(not_stormy_airport).to receive(:stormy?).and_return(false)
  end
  
  describe 'capacity' do
    it 'capacity cannot be less than planes in the airport' do
      5.times { subject.add_plane plane }
      expect { subject.change_capacity 4 }.to raise_error 'Cannot accommodate all planes'
    end

    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "allows setting custom capacity" do
      not_stormy_airport.change_capacity 70
      expect { 70.times { not_stormy_airport.accept_plane plane } }.to_not raise_error
    end    
  end

  describe "accept_plane" do
    it { is_expected.to respond_to(:accept_plane).with(1).argument }
 
    it 'throws an error if the airport is full (default capacity- 30)' do
      30.times { not_stormy_airport.add_plane plane }
      expect { not_stormy_airport.accept_plane plane }.to raise_error 'Airport full'
    end

    it 'throws an error if weather is stormy' do
      expect { stormy_airport.accept_plane plane }.to raise_error 'No landing- stormy weather!'
    end
    
    it 'accepts a plane if weather is not stormy' do
      not_stormy_airport.accept_plane plane
      expect(not_stormy_airport.plane_here? plane).to be true
    end
  end
  
  describe "release_plane" do
    it { is_expected.to respond_to(:release_plane).with(1).argument }

    it 'throws an error if plane not found in the airport' do
      allow(subject).to receive(:plane_here?).with(plane).and_return(false)
      expect { subject.release_plane plane }.to raise_error 'Plane not found!'
    end
    
    it 'throws an error if weather is stormy' do
      allow(stormy_airport).to receive(:plane_here?).with(plane).and_return(true)
      expect { stormy_airport.release_plane plane }.to raise_error 'No taking off- stormy weather!'
    end

    it 'allows a plane to take off from airport if weather is not stormy' do
      not_stormy_airport.accept_plane plane
      not_stormy_airport.release_plane plane
      expect(subject.plane_here? plane).to be false
    end
  end 
  
  describe '#add_plane' do
    it 'allows a newly generated plane to be added to an available airport' do
      subject.add_plane plane
      expect(subject.plane_here? plane).to eq true
    end
  end
end
