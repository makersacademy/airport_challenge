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

  
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to :take_off }


  describe 'take_off' do

    it 'instructs a plane to take off' do
      plane = Plane.new
      subject.land_plane plane
      expect(plane.landed?).to be true
      expect(subject.take_off).to be plane
      expect(plane.flying?).to be true
    end
  
    # it 'releases a plane' do
    #   plane = double :plane, flying?: true
    #   subject.land_plane plane
    #   expect(subject.trelease_plane).to be plane
    # end
  end

  # describe 'landing' do
  #   it 'instructs a plane to land' do
  #     plane = Plane.new
  #     subject.flying? plane
  #     expect(plane.flying?).to be plane

  #   xit 'receives a plane'
  # end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        plane = Plane.new
      expect(plane.flying?).to be true
      expect { subject.land_plane }.to raise_error 'Airoport is full'
    end

  #   # Include a weather condition.
  #   # The weather must be random and only have two states "sunny" or "stormy".
  #   # Try and take off a plane, but if the weather is stormy,
  #   # the plane can not take off and must remain in the airport.
  #   #
  #   # This will require stubbing to stop the random return of the weather.
  #   # If the airport has a weather condition of stormy,
  #   # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        plane = Plane.new
        subject.land_plane plane
        expect(plane.landed?).to be true
        expect { subject.take_off plane}.to raise_error 'the weather is stormy,the plane can not take off'
      end

      it 'does not allow a plane to land' do
        plane = Plane.new
        expect(plane.flying?).to be true
        expect { subject.land_plane}.to raise_error 'the weather is stormy,the plane can not land'
      end
    end
  end
end
end
