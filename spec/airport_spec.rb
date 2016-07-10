require "airport"
require "plane"

describe Airport do
  subject(:airport) {Airport.new} #give new instance name airport

  describe "#land" do
    subject(:airport) {Airport.new}
    it "lands a plane" do
      expect(airport).to respond_to(:land).with(1).argument
    end
  end
end
