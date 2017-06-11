require "airport.rb"
require "plane.rb"

describe Airport do
  it "responds to land method" do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it "responds to take_off method" do
    expect(subject).to respond_to(:take_off).with(1).argument
  end

  it "confirms that a plane has landed" do
    plane = Plane.new
    subject.land(plane)
    expect(plane).to be_landed
  end

  it "confirms that a plane has taken off" do
    plane = Plane.new
    subject.take_off(plane)
    expect(plane).not_to be_landed
  end

  describe "#land" do



    it "instructs a plane to land" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
  end

  describe "#take_off" do
    it "prevents takeoff if the weather is stormy" do
      plane = Plane.new
      allow(subject).to receive(:good_weather) { rand(100) < 20}
      expect{(subject.take_off(plane))}.to raise_error("No takeoff when stormy")
    end

    it "instructs a plane to take off" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end
  end

  it "returns the landed plane" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.terminal).to eq [plane]
  end
end
