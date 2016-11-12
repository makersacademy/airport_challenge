require 'plane'
require 'airport'

describe Plane do

  context "land" do

    it "should be able to respond to land method" do
      expect(subject).to respond_to :land
    end

    it "should land the plane at an airport" do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it "should be able to respond to landed? method" do
      expect(subject).to respond_to :landed?
    end

    it "should be able to land at an airport and confirm it's landed" do
      airport = Airport.new
      subject.land(airport)
      expect(subject).to be_landed
    end

  end

end
