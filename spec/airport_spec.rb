require 'Airport'
require 'Plane'

RSpec.describe Plane do  #subject stands for the class (ie plane)

  describe "land_at_airport" do    #land_at_airport is my method test
    it {is_expected.to respond_to (:land)}
  end

  describe "location_of_plane" do
    it {is_expected.to respond_to (:location)}
  end

  # describe "confirm_location_of_plane" do  #this is short hand 
  #   plane = Plane.new
  #   plane.land
  #   subject {plane.location}
  #   it {is_expected.to eq ("airport")}
  # end

  #long hand way of writing our test methods
  describe "confirm_location_of_plane" do 
    plane = Plane.new #making sure i have plane and location are at the right place to do a test against
    plane.land   #same as above note 
    it "checking that location is now airport" do
      expect(plane.location).to eq ("airport") 
    end
  end

  describe "confirm_airport_capacity" do
    plane = Plane.new
    plane.capacity
    it "check that airport is at capacity" do
      expect(plane.capacity).to eq (1)
    end
  end

  describe "no_landing_if_airport_at_capacity" do
    plane = Plane.new
    plane.capacity
    it "should not allow landing if airport at capacity" do
      expect(plane.no_landing).to eq ("full")
    end
  end

  describe "take_off" do
    plane = Plane.new
    plane.location
    it "should tell you airport capacity is back to 0" do
      expect(plane.take_off).to eq (0)
    end
  end

  describe "stormy_weather" do
    plane = Plane.new
    plane.location
    it "should ask you to not fly due to stormy weather" do
      expect(plane.storm).to eq ("no_take_off")
    end
  end

  describe "stormy_weather" do
    plane = Plane.new
    plane.location
    it "should ask you not to land due to stormy weather" do
      expect(plane.stormy_weather).to eq ("no_landing")
    end
  end

  describe "Good_weather" do 
    plane = Plane.new
    plane.capacity
    it "should tell you to Fly due to good weather" do
      expect(plane.fly).to eq (0)
    end 
  end

end


