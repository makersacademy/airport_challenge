require 'airport'

describe Airport do

  describe "#initialize" do

    it "should set capacity if supplied as argument" do
      airport = Airport.new(99)
      expect(airport.capacity).to eq(99)
    end
      
    it "should set capacity as default if no argument" do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end
    
  end

  describe "#takeoff_plane" do
    # it "should instruct plane to take off" do
    # end
    # it "should not allow plane to take off if stormy" do
    # end
    # it "should confirm plane has taken off" do
    # end
  end

  describe "#land_plane" do
    # it "should instruct plane to land" do
    # end
    # it "should not allow plane to land if stormy" do
    # end
    # it "should not allow plane to land if full" do
    # end
  end

end

