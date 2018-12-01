require 'airport.rb'
require 'plane.rb'

describe Airport do

  describe ".land" do
    it "lands a plane at the airport" do
      expect(subject).to respond_to :land
      plane = Plane.new
      expect (subject.land(plane)).equal? plane
    end
  end

  describe ".takeoff" do
    it "allows a plane to takeoff from the airport" do
      expect(subject).to respond_to :takeoff
      plane = Plane.new
      expect (subject.takeoff).equal? plane

    end
  end

end
