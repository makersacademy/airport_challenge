require 'plane'

describe Plane do

  describe "#plane_receives_instruction" do
    it "should respond to the air traffic controller" do
        plane = Plane.new
        
        expect(plane).to respond_to :instruction
    end
  end

end