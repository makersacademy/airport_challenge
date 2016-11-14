require 'airport.rb'

  describe Airport do

    subject(:airport) {described_class.new}
    let(:plane) { double :plane }

    context "Test landing, taking off and planes at airport in sunny weather" do

      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "should test that plane has landed" do
          expect(airport.land_plane(plane)).to eq [plane]
      end

      it "should test that a plane has taken off from the airport" do
        airport.land_plane(plane)
          expect(airport.take_off(plane)).to eq [plane]
      end

      it "should test that the planes avaiable will be shown when the method planes is called" do
        airport.land_plane(plane)
          expect(airport.planes).to eq [plane]
      end

    end


    context "Raise error" do


      before do
        allow(airport).to receive(:stormy?).and_return false
      end

      it "should raise an error when the amount of planes in the airport if full and a plane is trying to land" do
        Airport::DEFAULT_CAPACITY.times {subject.land_plane double(:plane)}
          expect{airport.land_plane(plane)}.to raise_error("This airport is full to capacity, please go to the next nearest airport to land")
      end

      it "should raise an error if plane is not in the airport that it is being instructed to take off from" do
        allow(gatwick_airport = Airport.new).to receive(:stormy?).and_return false
        gatwick_airport.land_plane(plane)
        expect {airport.take_off(plane)}.to raise_error("Plane cannot take off as it is not currently in this airport")
      end

      # it "should test that the plane in flight cannot take off again" do
      #   flying_plane = airport.take_off(plane)
      #   expect{airport.take_off(flying_plane)}.to raise_error("This plane is in flight")
      # end
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
