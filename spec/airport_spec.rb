require './docs/airport'

describe Airport do
  describe "#land" do # method will be called to land planes
    it "should instruct a plane to land" do # what I want the method to do
      #aeroplane = Airport.new  # creating a new instance of Airport
      expect(subject).to respond_to(:land) # expect aeroplane to respond to the land method
    end
  end

  describe "#take_off" do
    it "should instruct a plane to take off" do
      aeroplane = Airport.new
      expect(aeroplane).to respond_to(:take_off)
    end
  end
end
# we can instruct a plane to land and take off. Take off confirms that the plane is in the air.
# next prevent landing when airport is full 