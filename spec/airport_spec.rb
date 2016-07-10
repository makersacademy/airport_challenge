require "airport"
require "plane"

describe Airport do

  describe "#land" do
    subject(:airport) {Airport.new} #give new instance name airport
    it "lands a plane" do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end
end
