require 'airport'

describe Airport do
    let(:airport) { Airport.new(40, weather_reporter) }  #fixed capacity
    let(:plane) { Plane.new } 
    let(:weather_reporter) { Weather_Reporter }

    context 'when not stormy' do
      before do
        allow_any_instance_of(weather_reporter).to receive(:stormy?).and_return false
      end
# #     As an air traffic controller 
# #     So I can get passengers to a destination 
        it 'instruct a plane to land at an airport' do
            expect { airport.land(plane) }.not_to raise_error
        end

        # # As an air traffic controller 
        # # So I can get passengers on the way to their destination 
        it 'instruct a plane to take off from an airport and no longer in the airport' do
          expect { airport.take_off(plane) }.not_to raise_error
        end

        # # As an air traffic controller 
        # # To ensure safety 
        context "when airport is full" do
          it "raise_error - does_not land" do
            40.times { airport.land(plane) } # land so the capacity is filled
            expect { airport.land(plane) }.to raise_error "this airport is full"
          end
        end
    end

 context "when is stormy" do
    before do 
      allow_any_instance_of(weather_reporter).to receive(:stormy?).and_return true
      end
      it "does not allow planes to land" do
        expect { airport.land(plane) }.to raise_error "stormy weather, cannot land"
      end

      it 'does not allow planes to take off' do
      expect { airport.take_off(plane) }.to raise_error "stormy weather, cannot take off"
      end
  end
end