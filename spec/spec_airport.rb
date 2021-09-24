require 'airport'
require 'Plane'

RSpec.describe Plane do
  describe "Check plane is flying or grounded" do
    it "Test on flying plane" do
      testplane = subject.initialise("flying")
      expect(subject.is_plane_flying?).to eq("flying") 
    end

    it "Test on grounded plane" do
      testplane = subject.initialise("grounded")
      expect(subject.is_plane_flying?).to eq("grounded") 
    end
  end
end

RSpec.describe Plane do
  describe "Tests if a flying plane can land, while a grounded plane cannot" do
    it "Test if a flying plane can land" do
      testplane = subject.initialise("flying")
      expect(subject.land.is_plane_flying?).to eq("grounded")
    end
  end
end
