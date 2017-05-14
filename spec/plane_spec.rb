require 'plane'

describe Plane do

  describe "#landed?" do
    it "will return true that the plane has landed" do
      expect(subject).to respond_to :landed?
    end
  end

  describe "#take_off" do
    it "will return true when the plane has taken off" do
      expect(subject).to respond_to :take_off?
    end
  end
  
end
