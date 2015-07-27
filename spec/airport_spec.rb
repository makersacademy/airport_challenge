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
  let(:plane) { double(:plane) }
  describe 'take off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:release_plane)
    end
    it 'releases a plane' do
      allow(subject).to receive(:get_weather) { "sunny" }
      subject.accept_plane(plane)
      first_count = subject.plane_count
      subject.release_plane(plane)
      expect(subject.plane_count).to be < first_count
    end
  end

  describe 'landing' do
    it 'instructs a plane to land' do
      expect(subject).to respond_to(:accept_plane)
    end

    it 'receives a plane' do
      first_count = subject.plane_count 
      allow(subject).to receive(:get_weather) { "sunny" }
      subject.accept_plane(plane)
      expect(subject.plane_count).to be > first_count
    end
  end

  describe 'traffic control' do
    it 'raises an error if there are no gates available' do
      allow(subject).to receive(:get_weather) { "sunny" }
      subject.get_capacity.times { subject.accept_plane plane }
      expect { subject.accept_plane plane }.to raise_error "No gates available"
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    describe 'when weather conditions are stormy' do
      it 'does not allow a plane to take off' do
        allow(subject).to receive(:get_weather) { "sunny" }
        subject.accept_plane(plane)
        allow(subject).to receive(:get_weather) { "stormy" }
        expect { subject.release_plane plane }.to raise_error
         "Weather is stormy"
      end
      it 'does not allow a plane to land' do
        error_message = "Weather is stormy"
        allow(subject).to receive(:get_weather) { "stormy" }
        expect { subject.accept_plane plane }.to raise_error error_message
      end
    end
  end
end
