require 'airport'
require 'plane'

describe Airport do

  before :each do
    @airport = Airport.new
    @plane = Plane.new
  end

  describe "Take off" do

    it "lets a plane takeoff" do
      $weather = "sunny"
      expect(@airport).to respond_to(:takeoff).with(1).argument
    end

    it "confirms a plane has taken off" do
      $weather = "sunny"
      @airport.land(@plane)
      expect(@airport.takeoff(@plane)).to eq("Plane has taken off")
    end

    it "prevents takeoff when weather is stormy" do
      $weather = "stormy"
      expect{@airport.takeoff(@plane)}.to raise_error("Unable to takeoff due to stormy weather")
    end

    it "prevents a plane from taking off if plane is not in airport" do
      expect{@airport.takeoff(@plane)}.to raise_error("Unable to takeoff; plane not in airport")
    end

  end

  describe "Landing" do

    it "lands a plane" do
      expect(@airport).to respond_to(:land).with(1).argument
    end

    it "confirms a plane has landed" do
      $weather = "sunny"
      expect(@airport.land(@plane)).to eq("Plane has landed")
    end

    it "prevents landing when weather is stormy" do
      $weather = "stormy"
      expect{@airport.land(@plane)}.to raise_error("Unable to land due to stormy weather")
    end

    it "prevents landing when airport is full" do
      $weather = "sunny"
      5.times { @airport.land(@plane) }
      expect{@airport.land(@plane)}.to raise_error("Unable to land; airport is full")
    end

  end

  describe "Weather" do

    it "allows you to check weather" do
      expect(@airport.check_weather).to be_a(String)
    end

  end

  describe "Capacity" do

    it "has a default capacity of 5" do
      expect(Airport.new.capacity).to eq(5)
    end

    it "has a capacity of 10 when passed 10 as an argument" do
      expect(Airport.new(10).capacity).to eq(10)
    end

  end


end
