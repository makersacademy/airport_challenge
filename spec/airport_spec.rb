require_relative "../lib/airport"

RSpec.describe Airport do
  describe ".land" do
    it "allows a plane to land if the airport isn't full" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    it "raises error when a plane wants to land in a full airport" do
      50.times do
        subject.land(Plane.new)
      end
      expect{subject.land(Plane.new)}.to raise_error "Airport is full"
    end

    it "warns the plane that the weather is unsafe to land" do
      plane = Plane.new

  end

  describe ".take_off" do
    it "allows a plane to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end
end




