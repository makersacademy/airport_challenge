describe 'user stories' do
  let(:airport) { Airport.new(10) }
  let(:plane) { Plane.new }

  context "When weather is not stormy" do
    before do
      allow(airport).to receive(:stormy?).and_return false
    end
    # As an air traffic controller
    # So I can get passengers to a destination
    # I want to instruct a plane to land at an airport
    it "So planes can land at airports, instructs a plane to land" do
      expect { airport.land(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # So I can get passengers on the way to their destination
    # I want to instruct a plane to take off from an airport and confirm that
    # it is no longer in the airport.
    it "So planes can take off from airports, instruct a plane to take off" do
      expect { airport.take_off(plane) }.not_to raise_error
    end

    # As an air traffic controller
    # To ensure safety
    # I want to prevent landing when the airport is full
    context "When the airport is full" do
      it "Does not allow planes to land" do
        10.times do
          airport.land(plane)
        end
        expect { airport.land(plane) }.to raise_error "Plane cannot land at a full airport!"
      end
    end

      # As an air traffic controller
      # To ensure safety
      # I want to prevent landing/takeoff when weather is stormy.
    context "When weather is stormy" do
      before do
        allow(airport).to receive(:stormy?).and_return true
      end
      it "Does not allow planes to land" do
        expect { airport.land(plane) }.to raise_error "Plane cannot land during stormy conditions!"
      end

      it "Does not allow planes to take off" do
        expect { airport.take_off(plane) }.to raise_error "Plane cannot take off during stormy conditions!"
      end
    end
  end
end
