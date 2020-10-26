require 'airport'
require 'plane'

RSpec.describe Airport do
  it "creates a new airport" do
  end


  describe "#land" do
    it "instructs a plane to land at airport" do
      plane = Plane.new
      expect(subject.land("easyjet")).to eq subject.hangar
    end
  end

end
