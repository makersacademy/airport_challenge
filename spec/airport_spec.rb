require "airport"
require "plane"

describe Airport do
  it "is an airport where planes land" do
    expect(subject).to respond_to(:land).with(1).argument
  end
  it "is an airport where planes take off" do
    expect(subject).to respond_to(:lift).with(1).argument
  end
  describe "#land" do
    # it "should not land if airport is full" do
    #   plane = Plane.new
    #   expect { subject.land(plane) }.to raise_error(RuntimeError, "Airport full! Plane cannot land")
    # end
    it "should bring a plane down to an airport and return a confirmation" do
      plane = Plane.new
      expect(subject.land(plane)).to eq "Plane has landed"
    end
  end
  describe "#lift" do
    it "should lift a plane from an airport and returna  confirmation" do
      plane = Plane.new
      expect(subject.lift(plane)).to eq "Plane has taken off"
    end
    it "sends planes to flying mode" do
      plane = Plane.new
      subject.lift(plane)
      expect(plane).to be_flying
    end
  end

  # it "should not land if airport is full" do
  #   airport = Airport.new
  #   p airport
  #   plane = Plane.new
  #   p plane
  #   airport.full?
  #   p airport.full?
  #   p plane.land
  #   expect(plane.land).to eq "Plane cannot land"
  # end
end
