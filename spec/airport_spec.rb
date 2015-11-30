require 'airport'

describe Airport do
let (:plane) {Plane.new}
let (:plane2) {Plane.new}
subject (:airport) {described_class.new}

it "has a default capacity of MAX_CAPACITY" do
      expect(airport.capacity).to eq Airport::MAX_CAPACITY
    end

describe "#land" do
    context "When stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return(true)
      end

      it "Won't land a plane when it's stormy" do
        expect {airport.land(plane)}.to raise_error "Conditions too stormy. No planes can land."
      end
    end

    context "When not stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return(false)
      end

      it "Lands a Plane" do
        expect(airport.land(plane)).to eq [plane]
      end

      it "Adds a landed plane to the total list of planes" do
        airport.land(plane)
        airport.land(plane2)
        expect(airport.planes).to eq [plane, plane2]
      end

      it "Can confirm a plane has landed" do
        airport.land(plane)
        expect(airport.planes).to eq [plane]
      end

      it "Won't land a plane that has already been landed" do
          airport.land(plane)
          expect {airport.land(plane)}.to raise_error "That plane is already on the ground!"
      end
    end

    it "Raises an error when at capacity" do
        allow(airport).to receive(:full?).and_return(true)
        expect {airport.land(plane)}.to raise_error "Airport full! No Planes can land!"
    end
end



  describe "#take_off" do
    context "When Taking off" do
      before do
        allow(plane).to receive(:flying?).and_return(false)
      end
        context "When stormy" do
          before do
            allow(airport).to receive(:stormy?).and_return(true)
          end

          it "Won't take off a plane when it is stormy" do
            airport.planes << plane
            expect{airport.take_off(plane)}.to raise_error "Conditions too stormy. No planes can take off."
          end
        end

        context "When not Stormy" do
          before do
            allow(airport).to receive(:stormy?).and_return(false)
          end

          it "Allows a plane to take off" do
            allow(airport).to receive(:present?).and_return(true)
            expect(airport.take_off(plane)).to eq plane
          end

          it "Won't take off a plane that isn't in the airport" do
          allow(plane).to receive(:flying!).and_return(true)
          expect {airport.take_off(plane)}.to raise_error "That plane isn't here!"
          end
        end
      end
  end
end
