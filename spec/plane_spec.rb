require 'plane'

RSpec.describe Plane do
  describe "#land_at" do
    it "should tell a plane to land at an airport" do
      expect(subject).to respond_to(:land_at).with(1).argument
    end
  end

end