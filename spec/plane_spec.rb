require "rspec"
require "spec_helper"
require "plane"

describe Plane do
  let(:weather) { double :weather }
  let(:airport) { double :airport }

  context ".land" do
    it "in order to land, the plane must be flying" do
      plane = Plane.new(:airport)
      allow(weather).to receive(:stormy).and_return(0)
      expect(weather.stormy).to eq(0)
      allow(airport).to receive(:capacity).and_return(true)
      expect(airport.capacity).to eq(true)
      allow(airport).to receive(:hangar).and_return([])
      expect(plane.land(weather, airport)).to eq "plane not in the air and cannot land"
    end

    it "cannot land if the weather is stormy" do
      plane = Plane.new
      allow(weather).to receive(:stormy).and_return(1)
      expect(weather.stormy).to eq(1)
      allow(airport).to receive(:capacity).and_return(true)
      expect(airport.capacity).to eq(true)
      allow(airport).to receive(:hangar).and_return([])
      expect(plane.land(weather, airport)).to eq "stormy weather prevents landing"
    end

    it "can only land if the destination airport has capacity" do
      plane = Plane.new
      allow(weather).to receive(:stormy).and_return(0)
      expect(weather.stormy).to eq(0)
      allow(airport).to receive(:capacity).and_return(false)
      expect(airport.capacity).to eq(false)
      allow(airport).to receive(:hangar).and_return([])
      expect(plane.land(weather, airport)).to eq "airport full, cannot land"
    end
  end

  context ".take_off" do
    it "can only take-off from where it has landed and if the weather is good" do
      plane = Plane.new
      allow(weather).to receive(:stormy).and_return(0)
      expect(weather.stormy).to eq(0)
      allow(airport).to receive(:object_id).and_return(plane.location)
      expect(plane.location).to eq(airport.object_id)
      expect(plane.take_off(weather, airport)).to eq "take off"
    end
  end
end
