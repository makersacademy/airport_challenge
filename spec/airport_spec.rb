require "airport"
require "plane"

describe Airport do
  let(:plane) {Plane.new}
  subject(:airport) {described_class.new}
  subject(:large_airport) {described_class.new 40}

  describe "#initialize" do
    it "defaults to 15 capacity" do
      expect(airport.capacity).to eq described_class::DEFAULT_CAPACITY
    end

    it "can have a different capacity size" do
      expect(large_airport.capacity).to eq 40
    end
  end

  describe "#land_plane" do

      it 'only lands plane if plane is not landed already' do
        allow(airport.weather).to receive(:stormy).and_return false
        allow(large_airport.weather).to receive(:stormy).and_return false
        landed_plane = plane
        large_airport.land(landed_plane)
        expect{airport.land(landed_plane)}.to raise_error "That plane has landed elsewhere"
      end

      it "has plane in hangar after landing" do
        allow(airport.weather).to receive(:stormy).and_return false
        airport.land(plane)
        expect(airport.hangar).to include plane
      end

      it "prevents landing if airport is full " do
        allow(large_airport.weather).to receive(:stormy).and_return false
        large_airport.capacity.times {large_airport.land(Plane.new)}
        expect{large_airport.land(plane)}.to raise_error "Airport is full, you cannot land."
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

      it "should raise error if trying to take off plane that is not in hangar" do
        allow(airport.weather).to receive(:stormy).and_return false
        expect{airport.take_off(plane)}.to raise_error "That plane is not at this airport."
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
