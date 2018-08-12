require 'plane'

describe Plane do

  describe "#status" do
    it "@status - Plane responds to attribute" do
      expect(subject).to respond_to :status
    end
  end

  describe "#land" do
#    it ".land - Plane class responds to land method" do
#      expect(subject).to respond_to :land
#    end
    it ".land - Plane class responds to land method with 1 argument" do
      expect(subject).to respond_to(:land).with(1).argument
    end
  end

  describe "#takeoff" do
    it ".takeoff - Plane class responds to takeoff method" do
      expect(subject).to respond_to :takeoff
    end
  end

end
