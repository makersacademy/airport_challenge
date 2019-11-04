require 'plane'

describe Plane do
  it 'creates an instance of plane' do
    plane = Plane.new
    expect(plane).to be_instance_of(Plane)
  end
  
 descibe Plane do
   it 'lands at the airport safely' do
   plane = Plane.new
     expect(plane).to respond_to(:land)
   end
 end
