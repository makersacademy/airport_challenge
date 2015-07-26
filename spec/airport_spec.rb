require 'airport'

describe Airport do
  let(:landed_plane) {double(:landed_plane, :flying? => false)}
  let(:flying_plane) {double(:flying_plane,:flying? => true)}
  let(:landed_plane_stormy) {double(:landed_plane_stormy,:flying? => false, :stormy? => true)}
  let(:flying_plane_stormy) {double(:flying_plane_stormy,:flying? => true, :stormy? => true)}

  describe 'take off' do
    it 'instructs a plane to take off' do 
      allow(subject).to receive(:stormy?).and_return(false)
      expect(landed_plane).to receive(:take_off)
      subject.release landed_plane
    end 

    it 'releases a plane' do 
      expect(subject).to respond_to(:release).with(1).argument
    end 

    it 'cannot release a plane that is flying' do 
      allow(subject).to receive(:stormy?).and_return(false)
      expect{subject.release flying_plane}.to raise_error 'plane is already flying'
    end 
  end

  describe 'landing' do
    it 'instructs a plane to land' do 
      allow(subject).to receive(:stormy?).and_return(false)
      expect(flying_plane).to receive (:land)
      subject.receive flying_plane
    end 

    it 'receives a plane' do 
      expect(subject).to respond_to(:receive).with(1).argument
    end 

    it 'cannot receive a plane that is has landed' do 
      allow(subject).to receive(:stormy?).and_return(false)
      expect{subject.receive landed_plane}.to raise_error 'plane has already landed'
    end 
  end
  
  
  describe 'destination control' do
    it 'can change name' do 
    end 
  end 

  describe 'traffic control' do
    context 'when airport is full' do
      it 'has a capacity' do 
        expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
      end

      it 'Accepts a different capacity than default' do
        airport = Airport.new 50
        expect(airport.capacity).to eq 50
      end

      it 'test if Airport is full' do
        allow(subject).to receive(:stormy?).and_return(false)
        subject.capacity.times{subject.receive Plane.new}
        expect{subject.receive Plane.new}.to raise_error 'Airport is full'  
      end
    end

    context 'when weather conditions are stormy' do

      it 'does not allow a plane to take off' do 
        allow(subject).to receive(:stormy?).and_return(true)
        plane = landed_plane
        expect{subject.release plane}.to raise_error 'Cannot take off while weather is stormy'  
      end 

      it 'does not allow a plane to land' do 
        allow(subject).to receive(:stormy?).and_return(true)
        plane = Plane.new
        expect{subject.receive plane}.to raise_error 'Cannot land while weather is stormy'  
      end 
    end
  end
end
