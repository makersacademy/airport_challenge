require 'plane'

describe Plane do
   it 'define the plane class' do
     plane = Plane.new
   expect(plane).to be_a Plane
   end
end
