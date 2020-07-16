require './lib/plane'

describe Plane do

  # plane should be an instance of class plane
  it "plane is an instance of Plane class" do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end

  it "expect plane to respond to method land" do
    plane = Plane.new
    plane.land("London")
    expect(plane).to respond_to(:land)
  end

  it "expect plane to respond to method take_off" do
    plane = Plane.new
    plane.take_off
    expect(plane).to respond_to(:take_off)
  end

  describe "#land" do

    it "expect plane that land to have status landed" do
      plane = Plane.new
      plane.land("London")
      expect(plane.flying).to eq false
    end

    it "expect plane to land at destination" do
      plane = Plane.new
      plane.land("London")
      expect(plane.location).to eq "London"
    end

    it "expect to report where the plane landed" do
      plane = Plane.new
      expect { plane.land("London") }.to output("Landed at London airport\n").to_stdout
    end

  end

  describe "#take_off" do

    it "has left the airport and is flying" do
      plane = Plane.new
      plane.take_off
      expect(plane.location).to eq "in flight"
    end

    it "reports the plane has left the airport" do
      plane = Plane.new
      plane.take_off
      expect { plane.take_off }.to output("The plane has left the airport.\n").to_stdout
    end

  end

end
