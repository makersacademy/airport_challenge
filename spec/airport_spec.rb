require "airport.rb"

describe Airport do

  it "responds to ::DEFAULT_CAPACITY" do
    expect(Airport).to be_const_defined(:DEFAULT_CAPACITY)
  end

  subject(:airport) { described_class.new("Paris") }

  let(:plane) { instance_double("Plane") }

  describe ".new" do
    it "takes an argument" do
      expect{airport}.not_to raise_error
    end
    it "saves argument to @airport_name" do
      expect(airport.airport_name).to eq "Paris"
    end
    it "saves false to @full?" do
      expect(airport.full?).to eq false
    end
    it "saves empty array to @planes" do
      expect(airport.planes).to eq []
    end
  end

  describe "Instance of Airport" do

    describe ".airport_name" do
      it { is_expected.to respond_to(:airport_name) }
    end

    describe ".full?" do
      it { is_expected.to respond_to(:full?) }
    end

    describe ".capacity" do
      it { is_expected.to respond_to(:capacity) }
      context "specified capacity" do
        subject(:airport) { described_class.new("Paris", 2) }
        it "equals the specified capacity" do
          expect(airport.capacity).to be 2
        end
      end
      context "default capacity" do
        subject(:airport) { described_class.new("Paris") }
        it "has capacity equal to the default" do
          expect(airport.capacity).to be Airport::DEFAULT_CAPACITY
        end
      end
    end

    describe ".has_plane_docked?" do
      it { is_expected.to respond_to(:has_plane_docked?).with(1).argument }
      it "returns true if plane is docked" do
        airport.dock(plane)
        expect(airport).to have_plane_docked(plane)
      end
      it "returns false if plane is not docked" do
        expect(airport).not_to have_plane_docked(plane)
      end
    end

    context "docking planes" do

      describe ".dock" do
        it { is_expected.to respond_to(:dock).with(1).argument }
        it "adds a landed plane to @planes" do
          airport.dock(plane)
          expect(airport.planes).to include (plane)
        end
        it "sets @full? to true when capacity reached" do
          (Airport::DEFAULT_CAPACITY).times { airport.dock(plane) }
          expect(airport.full?).to be true
        end
      end
    end

    context "undocking planes" do
      describe ".undock" do
        it { is_expected.to respond_to(:undock).with(1).argument  }
        it "removes a taken off plane from @planes" do
          airport.dock(plane)
          airport.undock(plane)
          expect(airport.planes).not_to include plane
        end
        it "sets @full to false" do
          (Airport::DEFAULT_CAPACITY).times { airport.dock(plane) }
          airport.undock(plane)
          expect(airport.full?).to be false
        end
      end
    end
  end
end
