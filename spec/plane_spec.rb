require "plane"

describe Plane do

  let(:plane) { Plane.new }
  let(:airport) { double :airport }

  context "weather is stormy" do
    it "#land - raises an error" do
      expect {
        plane.land(
          airport: :airport,
          weather: :stormy
        )
      }.to raise_error "plane can't land, stormy weather"    
    end

    it "#take_off - raises an error" do
      expect {
        plane.take_off(
          airport: :airport,
          weather: :stormy
        )
      }.to raise_error "plane can't take off, stormy weather"    
    end
  end

  context "weather is sunny" do

    it "#land - raises error when airport is full" do
      allow(airport).to receive(:land).
        and_return(false)
      expect {
        plane.land(
          airport: airport,
          weather: :sunny
        )
      }.to raise_error "plane can't land, airport full"
    end

    it "#land - works fine if airport isn't full" do
      allow(airport).to receive(:land).
        and_return(true)
      expect(
        plane.land(
          airport: airport,
          weather: :sunny
        )
      ).to be true
    end

    it "#take_off succeeds if plane is indeed in specified airport" do
      allow(airport).to receive(:take_off).
        and_return(true)
      expect(
        plane.take_off(
          airport: airport,
          weather: :sunny
        )
      ).to be true
    end

    it "#take_off fails if plans is not in specified airport" do
      allow(airport).to receive(:take_off).
        and_return(false)
      expect {
        plane.take_off(
          airport: airport,
          weather: :sunny
        )
      }.to raise_error "plane is not in specified airport"
    end

  end

end
