require 'plane'

RSpec.describe Plane do
  describe ".flying?" do
    it "Test on flying plane" do
      testplane = subject.initialise("flying")
      expect(subject.flying?).to eq("flying") 
    end

    it "Test on grounded plane" do
      testplane = subject.initialise("grounded")
      expect(subject.flying?).to eq("grounded") 
    end
  end
end
