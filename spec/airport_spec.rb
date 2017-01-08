require "airport.rb"

describe Airport do

  it "responds to ::DEFAULT_CAPACITY" do
    expect(Airport).to be_const_defined(:DEFAULT_CAPACITY)
  end

  subject(:airport) { Airport.new("Paris") }

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
        subject(:airport) { Airport.new("Paris", 2) }
        it "equals the specified capacity" do
          expect(airport.capacity).to be 2
        end
      end
      context "default capacity" do
        subject(:airport) { Airport.new("Paris") }
        it "has capacity equal to the default" do
          expect(airport.capacity).to be Airport::DEFAULT_CAPACITY
        end
      end
    end

    context "docking planes" do

      describe ".dock" do
        it { is_expected.to respond_to(:dock).with(1).argument }
        it "adds a landed plane to @planes" do
          plane = instance_double("Plane")
          airport.dock(plane)
          expect(airport.planes).to include (plane)
        end
        it "sets @full? to true when capacity reached" do
          plane = instance_double("Plane")
          (Airport::DEFAULT_CAPACITY).times { airport.dock(plane) }
          expect(airport.full?).to be true
        end
      end
    end

    context "undocking planes" do
      describe ".undock" do
        it { is_expected.to respond_to(:undock).with(1).argument  }
      end
      it "removes a taken off plane from @planes" do
        plane = instance_double("Plane")
        airport.dock(plane)
        airport.undock(plane)
        expect(airport.planes).not_to include plane
      end
    end

  end




end
