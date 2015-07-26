require 'airport'

describe Airport do
  let(:landed_plane) {double(:landed_plane,{:flying? => false})}
  let(:flying_plane) {double(:flying_plane,{:flying? => true})}
  
  describe 'take off' do
    it 'instructs a plane to take off' do 
      expect(landed_plane).to receive(:take_off)
      subject.release landed_plane
    end 

    it 'releases a plane' do 
      expect(subject).to respond_to(:release).with(1).argument
    end 

  end

  describe 'landing' do
    it 'instructs a plane to land' do 
      expect(flying_plane).to receive (:land)
      subject.receive flying_plane
    end 

    it 'receives a plane' do 
      expect(subject).to respond_to(:receive).with(1).argument
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

      it "test if Airport is full" do
        subject.capacity.times{subject.receive Plane.new}
        expect{subject.receive Plane.new}.to raise_error 'Airport is full'  
      end

    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  end
end
