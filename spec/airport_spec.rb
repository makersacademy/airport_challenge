require 'airport'
require 'pry'

describe Airport do

  it "should respond to planes" do
    expect(subject).to respond_to :planes
  end

  context "park the plane" do

    it "should respond to park_plane method" do
      expect(subject).to respond_to :park_plane
    end

    it "should park the plane when the plane is landed" do
      plane = double(:plane)
      subject.park_plane(plane)
      expect(subject.planes).to include(plane)
    end

  end

  context "unpark the plane" do

    it "should respond to unpark_plane method" do
      expect(subject).to respond_to :unpark_plane
    end

    it "should unpark a plane when the plane is taken off " do
      plane1 = double(:plane)
      plane2 = double(:plane)
      subject.park_plane(plane1)
      subject.park_plane(plane2)
      subject.unpark_plane(plane2)
      expect(subject.planes).not_to include(plane2)

    end

  end

end
