require 'airport'

describe Airport do
  subject(:airport) { Airport.new }
  let(:plane) { double("a plane") }

  describe "#land" do
    context "when not stormy" do
      before :each do
        allow(airport).to receive(:stormy?).and_return false
      end

      context "when not at capacity" do
        it "returns plane when landed" do
          expect(airport.land(plane)).to include plane
        end
      end

      context "when at capacity" do
        context "when capacity is not specified" do
          before :each do
            Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
          end

          it "raises 'Airport at capacity' error" do
            expect { airport.land(plane) }.to raise_error "Airport at capacity"
          end
        end

        context "when capacity is specified" do
          variable_capacity = 30
          subject(:airport) { Airport.new(variable_capacity) }
          before :each do
            variable_capacity.times { airport.land(plane) }
          end

          it "raises 'Airport at capacity' error" do
            expect { airport.land(plane) }.to raise_error "Airport at capacity"
          end
        end
      end
    end

    context "when stormy" do
      it "raises 'Too stormy to land' error" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error "Too stormy to land"
      end
    end
  end

  describe "#take_off" do
    context "when not stormy" do
      before :each do
        allow(airport).to receive(:stormy?).and_return false
      end

      context "when plane is landed in airport" do
        let(:remaining_plane) { double("a plane")}
        before :each do
          airport.land(plane)
          airport.land(remaining_plane)
          airport.take_off(plane)
        end

        it "removes plane from airport" do
          expect(airport.planes).not_to include plane
        end

        it "does not remove ther planes from airport" do
          expect(airport.planes).to include remaining_plane
        end
      end

      context "when plane is not landed in airport" do
        it "raises 'Plane not in this airport' error" do
          expect { airport.take_off(plane) }.to raise_error "Plane not in this airport"
        end
      end
    end

    context "when stormy" do
      it "raises 'Too stormy to take off' error" do
        allow(airport).to receive(:stormy?).and_return true
        expect { airport.take_off(plane) }.to raise_error "Too stormy to take off"
      end
    end
  end
end
