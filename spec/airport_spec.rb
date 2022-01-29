require './docs/airport'

describe Airport do

  describe "#land" do # method will be called to land planes
    it "should instruct a plane to land" do # what I want the method to do
      # aeroplane = Airport.new  # creating a new instance of Airport
      expect(subject).to respond_to(:land).with(1).argument # expect aeroplane to respond to the land method
    end

    describe "#airport_full" 
    it "raises an error when the airport is full" do
      20.times { subject.airport_full Plane.new }
      expect { subject.airport_full Plane.new }.to raise_error 'Airport full'
    end
  end

  describe "#take_off" do
    it "should instruct a plane to take off" do
        plane = Plane.new
        subject.land(plane)
      expect(subject.take_off).to eq plane 
    end
  end
end

# we can instruct a plane to land and take off. Take off confirms that the plane is in the air.
# next prevent landing when airport is full 
