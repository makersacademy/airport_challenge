require 'plane'

describe Planes do
        it "responds to method flyinf" do
        plane = Planes.new
            expect(plane).to respond_to :flying
        end
    
end