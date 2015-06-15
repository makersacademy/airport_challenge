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

describe Airport do

  describe 'Airport' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'can set the default capacity' do
      expect(subject.capacity=(20)).to eq 20
    end
  end

  describe 'take off' do

    it 'instructs a plane to take off' do
      expect(subject).to respond_to :take_off
    end

    xit 'releases a plane'
    #     plane = double :plane, flying?: true
    #     allow(plane).to receive(:landed).and_return(false)
    #     # allow(plane).to receive(:take_off)
    #     subject.land_plane(plane)
    #     allow(subject).to receive(:weather).and_return("stormy")
    #     p subject.weather
    #     expect(subject.take_off plane).to be plane
    # end

    it 'raises an error when a plane is not in airport' do
      plane = double :plane
      expect{subject.take_off plane}.to raise_error "#{plane} not in airport"
    end

  end


  describe 'land plane' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to :land_plane
    end


    it 'receives a plane' do
      plane = double :plane, flying?: true
      expect(plane).to receive(:flying?)
      expect(plane).to receive(:landed)
      expect(subject.land_plane plane).to eq [plane]
    end

    it 'raises an error when a plane is not flying' do
      plane = double :plane, flying?: false
      expect{subject.land_plane plane}.to raise_error "#{plane} is not flying"
    end
  end


  describe 'traffic control' do

    context 'when airport is full' do
      it 'does not allow a plane to land' do
        allow(subject).to receive(:full?).and_return(true)
        expect{subject.land_plane(double :plane)}.to raise_error "Airport is full"
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

    # context 'when weather conditions are stormy' do
    xit 'does not allow a plane to take off'
    #   #   plane = double :plane, flying?: true
    #   #   subject.land_plane(plane)
    #   #   allow(subject).to receive(:weather) {'stormy'}
    #   #   expect{subject.take_off(plane)}.to raise_error 'Plane cannot take-off due to bad weather'
    #   # end
    # end

    xit 'does not allow a plane to land'
  end

end
