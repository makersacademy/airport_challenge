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

  it { is_expected.to respond_to(:take_off_plane) }

  it 'take off plane instructs a plane to take off' do
      subject.take_off_plane
      'plane flying'
    end

  it 'take off releases a plane' do
      subject.take_off_plane
    end

  it { is_expected.to respond_to(:land_plane).with(1).argument }

  # it 'land plane instructs a plane to land' do
  #     subject.land_plane(plane)
  #   end

  #   it 'receives a plane' do
  #     subject.land_plane
  #   end

    it { is_expected.to respond_to(:full?) }

    it 'has default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

      context 'when airport is full' do
       it 'does not allow a plane to land' do
        subject.capacity.times { subject.land_plane Plane.new }
    expect { subject.land_plane Plane.new }. to raise_error 'Airport is full.'
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

    it { is_expected.to respond_to(:stormy) }
    
    context 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        subject.stormy?
        
      end
    end

      xit 'does not allow a plane to land' do 

    end
  end



