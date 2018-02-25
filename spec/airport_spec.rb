require 'airport'

describe Airport do
  before(:each) do
    @weather_double_1 = double(:weather, :stormy? => true)
    @weather_double_2 = double(:weather, :stormy? => false)
    @plane_double = double(:plane)
    @plane_double_2 = double(:plane)
    @plane_class_double = double(:plane_class, :new => @plane_double_2)
    @sunny_airport = Airport.new(@weather_double_2, 1)
    @stormy_airport = Airport.new(@weather_double_1, 1)
  end

  context "creating a new airport" do
    it "has a default capacity" do
      expect(Airport.new.capacity).to eq 20
    end

    it "can have a specified capacity" do
      expect(@sunny_airport.capacity).to eq 1
    end

    it "is initialized with an empty hangar" do
      expect(Airport.new.hangar).to eq []
    end
  end

  context "landing a plane" do
    it "can land a plane in sunny weather" do
      expect(@sunny_airport.land(@plane_double)).to eq "Plane landed. Hangar contains #{@sunny_airport.hangar.count} plane(s)"
    end

    it "cannot land in stormy weather" do
      expect { @stormy_airport.land(@plane_double) }.to raise_error "Cannot land, bad weather"
    end

    it "cannot land a plane when it has already landed" do
      @sunny_airport.land(@plane_double)
      expect { @sunny_airport.land(@plane_double) }.to raise_error "Plane already landed"
    end

    it "cannot land plane when hangar is full" do
      @sunny_airport.land(@plane_double)
      expect { @sunny_airport.land(@plane_class_double.new) }.to raise_error "Cannot land, hangar is full"
    end

    it "stores landed planes in the hangar" do
      @sunny_airport.land(@plane_double)
      expect(@sunny_airport.hangar.include?(@plane_double)).to eq true
    end
  end

  context "plane taking off" do
    it "can launch a plane in sunny weather" do
      @sunny_airport.land(@plane_double)
      expect(@sunny_airport.takeoff(@plane_double)).to eq "Plane taken off. Hangar has #{@sunny_airport.hangar.count} plane(s) remaining"
    end

    it "cannot launch a plane in stormy weather" do
      airport = Airport.new(@weather_double_1, 1)
      airport.hangar=[@plane_double]
      expect { airport.takeoff(@plane_double) }.to raise_error "Cannot takeoff, bad weather"
    end

    it "no longer contains a plane after it has taken off" do
      @sunny_airport.land(@plane_double)
      @sunny_airport.takeoff(@plane_double)
      expect { @sunny_airport.takeoff(@plane_double) }.to raise_error "Plane not in airport"
    end
  end
end
