require "airport.rb"

describe Airport do
  it "responds to land method" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "confirms that a plane has landed" do
    plane = Plane.new
    subject.land(plane)
    expect(plane).to be_landed
  end

  describe "#land" do
    it "lands the plane" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  it "returns the landed plane" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.terminal).to eq [plane]
  end
end
