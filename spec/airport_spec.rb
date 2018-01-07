require 'airport'

describe Airport do

  subject(:airport) { described_class.new }
  
  describe "#initialize" do

    it "should set capacity if supplied as argument" do
      airport = Airport.new(99)
      expect(airport.capacity).to eq(99)
    end
      
    it "should set capacity as default if no argument" do
      expect(airport.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

  end

  describe "#takeoff_plane" do

    before do
      weather = double(:weather, :stormy? => false)
      airport.instance_variable_set(:@weather, weather)
      plane = double(:plane)
      airport.instance_variable_set(:@planes_in_hangar, [plane])
    end

    it "should instruct plane to take off" do
      expect(airport.takeoff(plane)).to eq plane
    end

    it "should confirm plane has taken off" do
      airport.takeoff(plane)
      expect(airport.planes_in_hangar).not_to include plane
    end

    it "should not allow plane to take off if stormy" do
      weather = double(:weather, :stormy? => true)
      airport.instance_variable_set(:@weather, weather)
      expect{ airport.takeoff(plane) }.to raise_error "Planes cannot take off due to bad weather"
    end

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
