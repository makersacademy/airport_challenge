require "./lib/airport.rb"
require "./lib/plane.rb"

describe Airport do
  let(:plane) { Plane.new }
  
  context "#land method" do
    it "should instruct a plane to land at airport" do
      subject.land(plane)
      expect(subject.landed_planes.last).to eq(plane)
    end

    it "should only let planes land" do
      expect { subject.land("helicopter") }.to raise_error "This is not a plane"
    end

    it "should not let landed planes to lane again" do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "This plane has already landed"
    end

  end

  context "#take_off method" do
    it "should instruct a plane to take off from airport" do
      subject.landed_planes = [plane]
      subject.take_off(plane)
      expect(subject.landed_planes).not_to include(plane)
    end

    it "should only let planes take off" do
      expect { subject.take_off("helicopter") }.to raise_error "This is not a plane"
    end

    it "should only let landed planes take off" do
      expect { subject.take_off(plane) }.to raise_error "This plane is not at the airport"
    end
  end
end
