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
      $weather = "sunny"
      expect{@airport.takeoff(@plane)}.to raise_error("Unable to takeoff; plane not in airport")
    end

    it "plane id is added to planes_outside_airports array when plane takes off" do
      $weather = "sunny"
      plane2 = Plane.new
      @airport.land(plane2)
      @airport.takeoff(plane2)
      expect($planes_outside_airports[-1]).to eq(plane2.object_id)
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
      5.times { @airport.land(Plane.new) }
      expect{@airport.land(@plane)}.to raise_error("Unable to land; airport is full")
    end

    it "only lands planes that are not already in airports" do
      $weather = "sunny"
      @airport.land(@plane)
      expect{@airport.land(@plane)}.to raise_error("Unable to land; plane is already in airport")
    end

    it "shows plane as in airport once landed" do
      $weather = "sunny"
      @airport.land(@plane)
      expect(@airport.planes_in_airport).to eq([@plane])
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
