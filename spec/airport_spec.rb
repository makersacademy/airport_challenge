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
  let (:plane) {Plane.new}


  describe 'take off' do
    it {is_expected.to respond_to(:instruct_takeoff).with(1).argument}

    it 'instructs a plane to take off' do
      plane.land(subject)
      subject.instruct_takeoff(plane)
      expect(plane).to be_flying
    end

    it "airport has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'removes planes that have left from the plane array' do
      plane.land(subject)
      plane.takeoff(subject)
      expect(subject.planes).to be_empty
    end
  end
  describe 'landing' do

    it "gives permission for planes to land" do
      expect(subject.request_land?(plane)).to eq true
      end

    it "gives permission for planes to takeoff" do
      plane.land(subject)
      expect(subject.request_takeoff?(plane)).to eq true
    end

    it 'instructs a plane to land' do
    subject.instruct_land(plane)
    expect(plane).not_to be_flying

    end

    it 'receives a plane' do
      subject.instruct_land(plane)
      expect(subject.planes[0]).to eq plane

    end
  end

  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
      subject.capacity.times { subject.planes << :plane }
      expect { plane.land(subject) }.to raise_error "Airport full"
      end
    end

    it "when a plane lands and takes off it should be the same plane" do
      plane.land(subject)
      plane.takeoff(subject)
      expect(plane).to eq plane
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
