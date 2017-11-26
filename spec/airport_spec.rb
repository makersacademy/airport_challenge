require "airport.rb"
require "plane.rb"
describe Airport do
  plane = Plane.new

  describe '#land_plane(plane)' do
    it "should allow the user to set capacity for the airport" do
      expect(subject.land_plane(plane)).to eq plane
    end
  end

  describe '#take_off(plane)' do
    it "should be able to tell plane to take off" do
      expect(subject.take_off(plane)).to eq subject.planes_at_airport
    end
  end
end
