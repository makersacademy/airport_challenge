require 'plane'

describe Plane do

  describe "#land" do
    it ".land - Plane class responds to land method" do
      expect(subject).to respond_to :land
    end
  end


  describe "#takeoff" do
    it ".takeoff - Plane class responds to takeoff method" do
      expect(subject).to respond_to :takeoff
    end
  end

end
