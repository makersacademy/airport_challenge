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
  end
end
