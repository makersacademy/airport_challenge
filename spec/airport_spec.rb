require "airport"

describe Airport do
  let(:plane) {:plane}
  subject(:airport) {described_class.new}

  describe "#land_plane" do
      it "should take a plane and add it to the hangar" do
        allow(airport.weather).to receive(:stormy).and_return false
        expect(subject.land(plane)).to eq [plane]
      end

      it "has plane in hangar after landing" do
        allow(airport.weather).to receive(:stormy).and_return false
        airport.land(plane)
        expect(airport.hangar).to include plane
      end

      it "prevents landing if airport is full" do
        allow(airport.weather).to receive(:stormy).and_return false
        described_class::DEFAULT_CAPACITY.times {airport.land(plane)}
        expect{airport.land(plane)}.to raise_error "Airport is full, you cannot land."
      end

      context "stormy" do
        it "should prevent landing if stormy" do
          allow(airport.weather).to receive(:stormy).and_return true
          expect{airport.land(plane)}.to raise_error "Landing unavailable. The storm is too heavy."
        end
      end
  end

  describe "#take_off_plane" do
    context "sunny" do
      it "should take off a plane and remove it from hangar" do
        allow(airport.weather).to receive(:stormy).and_return false
        airport.land(plane)
        expect(airport.take_off(plane)).to eq "#{plane} has taken off"
      end
    end

    context "stormy" do
      it "should prevent take off if stormy" do
        allow(airport.weather).to receive(:stormy).and_return false
        airport.land(plane)
        allow(airport.weather).to receive(:stormy).and_return true
        expect{airport.take_off(plane)}.to raise_error "The weather is too bad!"
      end
    end
  end
end
