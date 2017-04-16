require 'plane'

describe Plane do
  describe "#land" do
    it "Expects a plane to respond to #land with an argument" do
    expect(subject).to respond_to(:land).with(1).argument
    end
  end
end
