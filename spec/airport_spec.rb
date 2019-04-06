require 'airport'

RSpec.describe Airport do

  describe "#land" do
    it "lands the plane at the airport" do
      allow(subject).to receive(:random_forecast) { :fine }
      plane = Plane.new
      allow(subject).to receive(:land) { plane }
    end
  end

  describe "#takeoff" do
    it "allows plane to takeoff and confirms it has left airport" do
      allow(subject).to receive(:random_forecast) { :fine }
      plane = Plane.new
      expect(subject.takeoff).to eq "Plane has taken off"
    end
  end


  describe "#No_land" do
    it "prevents planes from landing in stormy weather" do
      allow(subject).to receive(:random_forecast) { :stormy }
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error "Plane cannot land in this weather"
    end
  end

  describe "#No_takeoff" do
    it "prevents planes from taking off in stormy weather" do
      allow(subject).to receive(:random_forecast) { :stormy }
      expect { subject.takeoff }.to raise_error "Plane cannot take off in this weather"
    end
  end
end
