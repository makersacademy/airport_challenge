require 'plane'

describe Plane do
  describe "#land" do
    before do
      @plane = Plane.new
    end

    it "confirms landing status" do
      expect do
        @plane.land
      end.to output('Plane has landed.').to_stdout
    end

    it "does not print something else apart from 'Plane has landed'" do
      expect do
        @plane.land
      end.to_not output('Plane has crashed').to_stdout
    end

  end
end
