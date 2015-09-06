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

  describe "weather" do
    it "responds to sky_clear" do
      expect(subject).to respond_to :sky_clear
    end
  end


  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to :instruct_take_off
    end

    it "raises an error when sky is not clear for take off" do
      expect { subject.instruct_take_off }.to raise_error "Sky is not clear for take off"
    end

    it 'releases a plane' do
      expect(subject).to respond_to(:release_plane).with(1).argument
    end

    it "raises an error when instruction for take off has not been received" do
      expect { subject.release_plane () }.to raise_error "No instruction for take off"
    end
  end


  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to :instruct_landing
    end

    it "raises an error when sky is not clear for landing" do
      expect { subject.instruct_landing }.to raise_error "Sky is not clear for landing"
    end

    it 'receives a plane' do
      expect(subject).to respond_to(:receive_plane).with(1).argument
    end

    it "raises an error when instruction for landing has not been received" do
      expect { subject.receive_plane () }.to raise_error "No instruction for landing"
    end
  end


  describe 'traffic control' do
    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::CAPACITY
    end

    context 'when airport is full' do
      # it 'raises an error when the airport is full' do
      #   subject.capacity.times {
      #   plane = Plane.new
      #   subject.instruct_landing
      #   subject.receive_plane plane
      #   }
      #   expect { subject.instruct_landing }.to raise_error "Airport is full"
      # end
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

  end
end
