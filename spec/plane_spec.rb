require './lib/plane'

describe Plane do
    plane = Plane.new
   it 'can return a new plane' do
       expect(plane).to be_instance_of(Plane)
   end
   it 'responds to #land' do
       expect(plane).to respond_to(:land)
   end
end