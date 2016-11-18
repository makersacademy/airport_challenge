require 'airport.rb'

  describe Airport do

    subject(:airport) {described_class.new}
    let(:plane) { double :plane, plane_landed: nil, take_off: nil }

    context "Test landing, taking off and planes at airport in sunny weather" do

      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "Should instruct the plane to land" do
        expect(plane).to receive(:plane_landed)
        airport.land_plane(plane)
      end

      it "should test that plane has landed" do
          expect(airport.land_plane(plane)).to include plane
      end

      it "should instruct the plane to take off" do
        airport.land_plane(plane)
        expect(plane).to receive(:take_off)
        airport.take_off(plane)
      end

      it "should test that a plane has taken off from the airport" do
        airport.land_plane(plane)
          expect(airport.take_off(plane)).to eq plane
      end

      it 'should return turn planes at the airport' do
        airport.land_plane(plane)
        expect(airport.planes).to include plane
      end

      it 'should return turn planes at the airport' do
        airport.land_plane(plane)
        airport.take_off(plane)
        expect(airport.planes).not_to include plane
      end
    end


    context "Raise error" do


      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "should raise an error when the amount of planes in the airport if full and a plane is trying to land" do
        Airport::DEFAULT_CAPACITY.times do
          a_plane = Plane.new
         subject.land_plane(a_plane)
        end
          expect{airport.land_plane(plane)}.to raise_error("This airport is full to capacity, please go to the next nearest airport to land")
      end

      it "should raise an error if plane is not in the airport that it is being instructed to take off from" do
        allow(gatwick_airport = Airport.new).to receive(:stormy?).and_return false
        gatwick_airport.land_plane(plane)
        expect {airport.take_off(plane)}.to raise_error("Plane cannot take off as it is not currently in this airport")
      end

    end

        context "#Stormy weather" do

          before do
            allow(airport).to receive(:stormy?).and_return true
          end

          it "should raise an error to prevent plane from taking off" do
            expect{airport.take_off(plane)}.to raise_error("All planes are grounded until further notice due to bad weather")
          end

          it "should raise an error that indicates a plane cannot land due to weather" do
            expect{airport.land_plane(plane)}.to raise_error("There is a storm at destination please divert to nearest airport")
          end
    end
end
