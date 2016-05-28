require 'airport'

describe Airport do

  let(:airport) { Airport.new }

  describe "#land" do

    it "responds to land method with 1 argument" do
    expect(airport).to respond_to(:land).with(1).argument
    end

    it "lands and stores plane at airport" do
    plane = Plane.new
    airport.land(plane)
    expect(airport.land(plane)).to eq [plane]
    end

  end

  describe "#confirm_landed" do

    it "responds to confirm_landed method with 1 argument" do
    expect(airport).to respond_to(:confirm_landed).with(1).argument
    end

    it "confirms if specific plane has landed" do
    plane = Plane.new
    airport.land(plane)
    expect(airport.confirm_landed(plane)).to eq true
    end

  end

  describe "#take_off" do

    it "responds to take_off method with 1 argument" do
    expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "causes plane to leave airport" do
    plane = Plane.new
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.take_off(plane)).to eq []
    end

  end

  describe "confirm_departed" do

    it "responds to confirm_departed method with 1 argument" do
    expect(airport).to respond_to(:confirm_departed).with(1).argument
    end

    # it "confirms if specific plane has departed" do
    # plane = Plane.new
    # airport.land(plane)
    # expect(airport.confirm_departed(plane)).to eq true
    # end
  end

  describe "#planes"

    it "responds to planes method" do
    expect(airport).to respond_to(:planes)
    end

    # it "lists planes currently landed at airport" do
    # plane = Plane.new
    # airport.land(plane)
    # expect(airport.planes).to eq plane
    # end

end