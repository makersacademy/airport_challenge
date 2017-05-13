require 'plane'

describe Plane do

  describe "#landed?" do
    it "will return true that the plane has landed" do
      expect(subject).to respond_to :landed?
    end
  end
end
