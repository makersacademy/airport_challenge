require 'airport'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  describe "#planes" do

    it "responds to planes method" do
    expect(airport).to respond_to(:planes)
    end

    it "lists planes currently landed at airport" do
    allow(airport).to receive(:stormy?).and_return false
    plane1 = Plane.new
    airport.land(plane1)
    plane2 = Plane.new
    airport.land(plane2)
    expect(airport.planes).to eq [plane1, plane2]
    end
  end

  describe "#land" do

    it "responds to land method with 1 argument" do
    expect(airport).to respond_to(:land).with(1).argument
    end

    it "lands and stores each plane at airport" do
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.planes).to eq [plane]
    end

    it "prevents plane landing when stormy" do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.land(plane) }.to raise_error "Cannot land plane: weather is stormy"
    end


  end

  describe "#confirm_landed" do

    it "responds to confirm_landed method with 1 argument" do
    expect(airport).to respond_to(:confirm_landed).with(1).argument
    end

    it "confirms if a landed plane is at the airport" do
    allow(airport).to receive(:stormy?).and_return false
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
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.take_off(plane)).to eq []
    end

    it "prevents plane taking-off when stormy" do
    allow(airport).to receive(:stormy?).and_return true
    expect { airport.take_off(plane) }.to raise_error "Cannot take-off: weather is stormy"
    end

  end

  describe "confirm_departed" do

    it "responds to confirm_departed method with 1 argument" do
    expect(airport).to respond_to(:confirm_departed).with(1).argument
    end

    it "confirms if a departed plane has left the airport" do
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    airport.take_off(plane)
    expect(airport.confirm_departed(plane)).to eq "#{plane} has departed airport"
    end

    it "confirms if a plane has not departed the airport" do
    allow(airport).to receive(:stormy?).and_return false
    airport.land(plane)
    expect(airport.confirm_departed(plane)).to eq "#{plane} has not departed airport"
    end

  end

end