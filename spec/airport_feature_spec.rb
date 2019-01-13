require 'airport'

RSpec.describe Airport do

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
    allow(@airport).to receive(:stormy).and_return(false)
    @plane1 = Plane.new
    @plane2 = Plane.new
    @plane3 = Plane.new
  end
  describe "feature tests" do
    it "is able to land a number of planes" do
      @airport.land(@plane1)
      @airport.land(@plane2)
      @airport.land(@plane3)
      expect(@airport.planes_in_airport).to eq([@plane1, @plane2, @plane3])
    end

    it "is able to take off a plane" do
      @airport.land(@plane1)
      @airport.land(@plane2)
      @airport.land(@plane3)
      expect(@airport.take_off(@plane1)).to eq(@plane1)
    end

    it "is able to check that a plane that took off is no longer in the airport" do
      @airport.land(@plane1)
      @airport.land(@plane2)
      @airport.land(@plane3)
      @airport.take_off(@plane1)
      expect(@airport.planes_in_airport.include?(@plane1)).to eq(false)
    end

    it "is able to verify that a plane that lands in one airport cannot land in another (without taking off)" do
      airport2 = Airport.new
      allow(airport2).to receive(:stormy).and_return(false)
      @airport.land(@plane1)
      expect { airport2.land(@plane1) }.to raise_error("This plane has already landed")
    end

    it "is able to verify that a plane that isn't in the airport cannot take off" do
      expect { @airport.take_off(@plane1) }.to raise_error("This plane doesn't exist in the airport")
    end

    it "is able to verify that a plane cannot land in case of a storm" do
      allow(@airport).to receive(:stormy).and_return(true)
      expect { @airport.land(@plane1) }.to raise_error("No landings permitted due to the storm")
    end

    it "is able to verify that a plane cannot land in case the airport capacity is full" do
      airport = Airport.new(1)
      allow(airport).to receive(:stormy).and_return(false)
      airport.land(@plane1)
      expect { airport.land(@plane2) }.to raise_error("No landings permitted due to the airport being full")
    end

    it "is able to verify that a plane cannot take off in case of a storm" do
      @airport.land(@plane1)
      allow(@airport).to receive(:stormy).and_return(true)
      expect { @airport.take_off(@plane1) }.to raise_error("No take offs permitted due to the storm")
    end

    it "initiates with capacity of 10 planes" do
      expect(@airport.capacity).to eq(10)
    end

    it "allows capacity to be set at the time of initiation" do
      airport = Airport.new(20)
      expect(airport.capacity).to eq(20)
    end
  end
end
