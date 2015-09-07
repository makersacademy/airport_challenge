require_relative '../lib/airport'

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

  it "initializes with preset capacity" do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it "initializes with an empty hangar" do
    expect(subject.hangar).to eq []
  end

  describe "incoming planes" do
    context "when a plane lands" do
      it "it is landed" do
        plane = Plane.new
        allow(plane).to receive(:status).and_return(:landed)
        subject.land_plane(plane)
        expect(plane.status).to eq (:landed)
      end
      it "it is added to the hangar" do
        subject.land_plane(Plane.new)
        expect(subject.hangar).not_to eq []
      end

      it "cannot land when the hangar is full" do
        subject.capacity.times {subject.land_plane(Plane.new)}
        expect{subject.land_plane(Plane.new)}.to raise_error "airport hangar full - unable to land"
      end

    end
  end

  describe "outgoing planes" do
    context "when a plane leaves" do
      it "it is flying" do
        plane = Plane.new
        allow(plane).to receive(:status).and_return(:flying)
        subject.plane_take_off(plane)
        expect(plane.status).to eq(:flying)
      end

      it "it is removed from the hangar" do
        plane = Plane.new
        subject.hangar = [plane]
        subject.plane_take_off(plane)
        expect(subject.hangar).to eq []
      end
    end
  end


end


# describe 'take off' do
#     xit 'instructs a plane to take off'

#     xit 'releases a plane'
#   end

#   describe 'landing' do
#     xit 'instructs a plane to land'

#     xit 'receives a plane'
#   end

#   describe 'traffic control' do
#     context 'when airport is full' do
#       xit 'does not allow a plane to land'
#     end

#     # Include a weather condition.
#     # The weather must be random and only have two states "sunny" or "stormy".
#     # Try and take off a plane, but if the weather is stormy,
#     # the plane can not take off and must remain in the airport.
#     #
#     # This will require stubbing to stop the random return of the weather.
#     # If the airport has a weather condition of stormy,
#     # the plane can not land, and must not be in the airport

#     context 'when weather conditions are stormy' do
#       xit 'does not allow a plane to take off'

#       xit 'does not allow a plane to land'
#     end
#   end