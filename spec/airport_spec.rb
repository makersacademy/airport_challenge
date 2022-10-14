require "airport"
require "plane"
require "weather"

describe Airport do 

    # Use before statement so that a new Airport and plane does not need to be created 
    # within each context block

  before(:each) do
    @airport = Airport.new
    @plane = Plane.new
    @airport.extend(Weather)
  end

  describe '#initialize' do
    it "should allow an airport to have a default capacity when created" do
      expect(@airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    # This is the fourth user story that allows the capacity of an airport to be overwritten

    it "should allow an airport to have an overidden capacity when created of 50" do
      larger_airport = Airport.new(50)
      expect(larger_airport.capacity).to eq 50
    end

  end

  describe "#landing" do 

    # This is the first user story that allows a plane to land

    it "should respond to landing a plane at an airport" do
      expect(@airport).to respond_to(:landing) 
    end

    # This is the third user story that prevents a plane from landing when the airport is full

    it "should respond to prevent landing a plane at an airport with error message if the airport is full" do
      allow(@airport).to receive(:stormy?) { false }
      @airport.capacity.times { @airport.landing(Plane.new, @airport) }
      expect { @airport.full? }.to raise_error("Cannot land as airport is full") 
    end

    it "should respond to prevent landing a plane at an airport with error message if the plane is already at the airport" do
      @airport.landing(@plane, @airport) 
      expect { @airport.landing(@plane, @airport) }.to raise_error("Plane cannot land as it is already at this airport") 
    end

    it "should respond to prevent landing a plane at an airport with error message if the plane is not flying" do
      airportb = Airport.new
      @airport.landing(@plane, @airport) 
      expect { airportb.landing(@plane, airportb) }.to raise_error("Plane cannot land as it is not flying") 
    end

    # This is the sixth user story that prevents a plane from landing when the weather is stormy

    it "should respond to prevent a plane landing by raising error when weather is stormy" do
    # Use Method Stubs to return true in response to a message so that the weather is stormy
      allow(@airport).to receive(:stormy?) { true }
      expect { @airport.landing(@plane, @airport) }.to raise_error("Plane cannot land as weather is stormy")
    end

  end 

  describe "#take_off" do 

    # These are the second user story that allows a plane to take off and check it is no longer at the airport

    it "should respond to allow a plane to take off from an airport" do
      expect(@airport).to respond_to(:take_off)
    end

    it "should test that if the only plane in the airport takes off an empty airport is returned" do
      allow(@airport).to receive(:stormy?) { false }
      @airport.landing(@plane, @airport)
      @airport.take_off(@plane, @airport)
      expect(@airport.planes).to eq []
    end

    it "should test that the airport array allows multiple planes to land" do
      allow(@airport).to receive(:stormy?) { false } 
      planeb = Plane.new
      @airport.landing(@plane, @airport)
      @airport.landing(planeb, @airport)
      expect(@airport.planes).to eq [@plane, planeb]
    end

    it "should test that a plane can only takes off if it is at that airport" do
      airportb = Airport.new
      @airport.landing(@plane, @airport)
      expect { airportb.take_off(@plane, airportb) }.to raise_error("Plane cannot take off as not at airport")
    end

    # This is the fifth user story that prevents a plane from taking off when the weather is stormy

    it "should respond to prevent a plane taking off by raising error when weather is stormy" do
    # Use Method Stubs to return true in response to a message so that the weather is stormy
      allow(@airport).to receive(:stormy?) { true }
      expect { @airport.take_off(@plane, @airport) }.to raise_error("Plane cannot take off as weather is stormy")
    end

    # The next four tests are attempts at the BONUS feature test and land and take off a number of planes

    it "should test that if multiple planes land and then a plane takes off there is one less plane in the airport" do
      allow(@airport).to receive(:stormy?) { false }
      @airport.landing(Plane.new, @airport) 
      @airport.landing(@plane, @airport)
      @airport.take_off(@plane, @airport)
      expect(@airport.planes.length).to eq 1
    end
  
    it "should test that if two planes land and then the first plane takes off the second plane is left in the airport" do
      allow(@airport).to receive(:stormy?) { false }
      planeb = Plane.new
      @airport.landing(@plane, @airport) 
      @airport.landing(planeb, @airport)
      @airport.take_off(@plane, @airport)
      expect(@airport.planes).to eq [planeb]
    end
  
    it "should test that if multiple planes land and then the first plane takes off the remaining planes are left in the airport" do
      allow(@airport).to receive(:stormy?) { false }
      planeb = Plane.new
      planec = Plane.new
      planed = Plane.new
      @airport.landing(@plane, @airport) 
      @airport.landing(planeb, @airport)
      @airport.landing(planec, @airport)
      @airport.landing(planed, @airport)
      @airport.take_off(@plane, @airport)
      expect(@airport.planes).to eq [planeb, planec, planed]
    end
  
    it "should test that if four planes land and then the second and third planes takes off the remaining planes are left in the airport" do
      allow(@airport).to receive(:stormy?) { false }
      planeb = Plane.new
      planec = Plane.new
      planed = Plane.new
      @airport.landing(@plane, @airport) 
      @airport.landing(planeb, @airport)
      @airport.landing(planec, @airport)
      @airport.landing(planed, @airport)
      @airport.take_off(planeb, @airport)
      @airport.take_off(planec, @airport)
      expect(@airport.planes).to eq [@plane, planed]
    end

  end

  describe '#stormy?' do

    it "should respond to 'stormy' method" do 
      expect(@airport).to respond_to(:stormy?)
    end

  end

end
