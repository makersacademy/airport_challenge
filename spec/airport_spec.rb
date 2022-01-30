require './docs/airport'

describe Airport do

  describe "#land" do 
    it "should instruct a plane to land" do 
      expect(subject).to respond_to(:land).with(1).argument
    end
  end
  
  describe "#airport_full" 
  it "raises an error when the airport is full" do
    Airport::DEFAULT_CAPACITY.times do
      subject.airport_full Plane.new
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
