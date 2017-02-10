require 'airport'

describe Airport do

  let(:plane) { double (:plane) }
  let(:plane1) {double (:plane) }

  it "should respond to planes" do
    expect(subject).to respond_to :planes
  end

  context "park the plane" do

    it "should respond to park_plane method" do
      expect(subject).to respond_to :park_plane
    end

    it "should park the plane when the plane is landed" do
      subject.park_plane(plane)
      expect(subject.planes).to include(plane)
    end

    it "should set airport capacity to 20 by default" do
      expect(subject.capacity).to eq 20
    end

    it "should be able to set airport capacity" do
      airport = Airport.new(capacity = 10)
      expect(airport.capacity).to eq 10
    end

    it "should be able to park the plane if it's not full" do
      airport = Airport.new(capacity = 2)
      airport.park_plane([plane])
    end

    it "should NOT park the plane if the airport is full" do
      airport = Airport.new(capacity = 1)
      airport.park_plane(plane)
      expect{ airport.park_plane(plane) }.to raise_error("The airport is full.")
    end

  end

  context "unpark the plane" do

    it "should respond to unpark_plane method" do
      expect(subject).to respond_to :unpark_plane
    end

    it "should unpark a plane when the plane is taken off " do
      subject.park_plane(plane)
      subject.unpark_plane(plane)
      expect(subject.planes).not_to include(plane)
    end

  end

  it "should take off from the airport in which the plane is landed" do
    airport1, airport2 = Airport.new, Airport.new
    airport1.park_plane(plane)
    expect{ airport2.unpark_plane(plane) }.to raise_error "No such plane in the airport."
  end

end
