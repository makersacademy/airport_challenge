require 'plane'

describe Planes do
        it "responds to method land" do
        plane = Planes.new
            expect(plane).to respond_to :land
        end
    
end