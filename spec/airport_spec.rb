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

    #let(:glasgow) {Airport.new}

    # let(:pl101)   {double :plane, flying: 'flying'}
    it { is_expected.to respond_to :planes }
    it { is_expected.to respond_to :count_planes }


    it 'counts the number of planes in the aiport' do
      expect(subject.count_planes).to eql 0
    end

    it 'should allow a plane to land' do
      plane = Plane.new
      subject.clear_to_land(plane)
      puts plane.flying
      expect(plane.flying).to eql("landed")
    end

    it 'should allow a plane to take off' do
      plane = Plane.new
      puts plane #why does this not show the flying variable
      subject.clear_to_land(plane)
      subject.clear_to_take_off(plane)
      expect(plane.flying).to eql("flying")
    end

    it 'should prevent a plane from landing if the airport is full' do
      subject.capacity.times {subject.clear_to_land Plane.new}

      expect {subject.clear_to_land Plane.new}.to raise_error 'Airport at Capacity'
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


      xit 'does not allow a plane to land' do
      end

    end

end
