require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe "#land" do

    it "responds to land method with 1 argument" do
    expect(airport).to respond_to(:land).with(1).argument
    end

    it "lands and stores plane at airport" do
    airport.land(plane)
    expect(airport.planes).to eq [plane]
    end

  end

  describe "#confirm_landed" do

    it "responds to confirm_landed method with 1 argument" do
    expect(airport).to respond_to(:confirm_landed).with(1).argument
    end

    it "confirms if a landed plane is at the airport" do
    airport.land(plane)
    expect(airport.confirm_landed(plane)).to eq "#{plane} has landed at airport"
    end

    it "confirms if a landed plane is NOT at the airport" do
    expect(airport.confirm_landed(plane)).to eq "#{plane} has not landed at airport"
    end

  end

  describe "#take_off" do

    it "responds to take_off method with 1 argument" do
    expect(airport).to respond_to(:take_off).with(1).argument
    end

    it "causes plane to leave airport" do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.take_off(plane)).to eq []
    end

  end

  describe "confirm_departed" do

    it "responds to confirm_departed method with 1 argument" do
    expect(airport).to respond_to(:confirm_departed).with(1).argument
    end

    it "confirms if a departed plane has left the airport" do
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.confirm_departed(plane)).to eq "#{plane} has departed airport"
    end

    it "confirms if a plane has not departed the airport" do
    airport.land(plane)
    expect(airport.confirm_departed(plane)).to eq "#{plane} has not departed airport"
    end

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