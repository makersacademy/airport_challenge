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

end
