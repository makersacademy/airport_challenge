require 'airport'



describe Airport do

  describe 'take off' do
    it 'instructs a plane to take off' do 
      expect(subject).to respond_to(:take_off).with(1).argument
    end


    it 'releases a plane when it was the last plane that landed' do 
      test_plane = double :plane, landed?: true
      subject.land test_plane
      subject.take_off test_plane
      expect(subject.landed_planes).to eq []
    end

    it 'releases specific plane, even if not last to land' do 
      test_plane = double :plane, landed?: true
      filler_plane1 = double :plane, landed?: true
      filler_plane2 = double :plane, landed?: true
      subject.land filler_plane1
      subject.land test_plane
      subject.land filler_plane2
      subject.take_off test_plane
      expect(subject.landed_planes).to eq [filler_plane1,filler_plane2]
    end

    it 'cannot tell a plane to take-off if airport is empty' do 
      test_plane = double :plane,landed?: true
      expect{subject.take_off test_plane}.to raise_error 'No planes to take off'
    end

  end

  describe 'landing' do
    it 'instructs a plane to land' do 
      expect(subject).to respond_to(:land).with(1).argument
    end


    it 'receives a plane' do 
      test_plane = double :plane, flying?: true
      subject.land test_plane
      expect(subject.landed_planes).to eq [test_plane]
    end
  end

  describe 'capacity' do 
    it 'has a (default) maximum capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'airport has no landed planes when created' do 
      expect(subject.landed_planes).to eq []
    end

  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        subject.capacity.times {subject.land double :plane, flying?: true}
        expect{subject.land double :plane}.to raise_error "Airport is full"
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

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land