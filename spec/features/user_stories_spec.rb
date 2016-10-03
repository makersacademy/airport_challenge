require "airport.rb"
require "plane.rb"

describe "user_stories" do

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
# and confirm that it has landed
  let(:airport) { Airport.new(50) }
  let(:plane) { Plane.new }
  context 'when weather is not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
      it "airport can instruct a plane to land" do
        expect { airport.land(plane) }.not_to raise_error
      end

      it "airport can confirm that a plane has landed" do
        expect { airport.confirm_land(plane) }.not_to raise_error
      end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport
# and confirm that it is no longer in the airport

      it "airport can instruct a plane to take off" do
        expect { airport.take_off(plane) }.not_to raise_error
      end

      it "airport can confirm that a plane is no longer in the airport" do
        expect { airport.confirm_take_off(plane) }.not_to raise_error
      end
      # As an air traffic controller
      # To ensure safety
      # I want to prevent landing when the airport is full
      context 'when airport is full' do
        it "airport prevents plane from landing" do
          50.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error "can't land plane, airport is full"
        end
      end
    end

  # As an air traffic controller
  # To ensure safety
  # I want to prevent takeoff when weather is stormy

  # As an air traffic controller
  # To ensure safety
  # I want to prevent landing when weather is stormy
  context 'when weather is stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end
      it "airport does not allow planes to land" do
        expect { airport.land(plane) }.to raise_error "can't land plane due to stormy weather"
      end

      it "airport does not allow planes to take off" do
        expect { airport.take_off(plane) }.to raise_error "can't take off due to stormy weather"
      end
  end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

end
