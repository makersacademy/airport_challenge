require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

 describe "initial state of airport" do

    it "will have spaces for planes" do
      expect @plane == []
    end

    it "will have a capacity of 20 planes" do
      airport = Airport.new
      expect(airport.capacity).to eq 20
    end

  end

describe Airport do

  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off_clearance
    end
      
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to :landing_clearance
    end

     it 'receives a plane' do
      airport = subject.land(plane)
      expect(airport).to have_plane(plane)
     end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = Plane.new
        subject.capacity.times {subject.land plane}
        expect { subject.land plane }.to raise_error('Max capacity reached - airport is full')
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

    #creating an error. Have spent all weekend staring at my screen - behind already.
    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        allow(subject).to receive(:weather) { 'sunny' }
        subject.land (plane)
        allow(subject).to receive(:weather) { 'stormy' }
        expect { subject.take_off(plane) }.to raise_error 'It is stormy - you cannot take off!'
      end
      xit 'does not allow a plane to land'
    end
  end
end