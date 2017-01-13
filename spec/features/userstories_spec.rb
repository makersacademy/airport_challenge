require 'plane'
require 'airport'

describe "User Stories" do
  let(:airport) { Airport.new(20) }
  let(:plane) { Plane.new }

  context 'when not stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end

    #User Story 1
    #As an air traffic controller
    #So I can get passengers to a destination
    #I want to instruct a plane to land at an airport and confirm that it has landed
    describe Airport do
      it "so that planes can land at airports, instruct a plane to land" do
        expect { airport.land(plane) }.not_to raise_error
      end
    end

        #User Story 2
        #As an air traffic controller
        #So I can get passengers on the way to their destination
        #I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
        it 'so that planes take off from airports, instruct a plane to take off' do
          expect { airport.take_off(plane) }.not_to raise_error
        end

        #User Story 3
        #As an air traffic controller
        #To ensure safety
        #I want to prevent landing when the airport is full
          context 'when airport is full' do
            it 'does not allow planes to land' do
              20.times { airport.land(plane) }
              expect { airport.land(plane) }.to raise_error "Cannot land plane: airport full."
            end
          end
      end


  context 'when stormy' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end

      #User Story 4
      #As an air traffic controller
      #To ensure safety
      #I want to prevent landing when weather is stormy
      it 'it does not allow planes to land' do
        expect {airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy."
      end

      #User Story 5
      #As an air traffic controller
      #To ensure safety
      #I want to prevent takeoff when weather is stormy

      it 'it does not allow planes to take-off' do
        expect {airport.take_off(plane) }.to raise_error "Cannot take-off: weather is stormy."
      end
  end
end
