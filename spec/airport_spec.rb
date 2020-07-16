require "airport.rb"
describe Airport do

 it 'can create an instance of Airport' do
   airport = Airport.new
    expect(airport).to be_kind_of(Airport)
end

require "plane.rb"
 it 'can respond to land' do
   plane = Plane.new
  expect(plane).respond_to?(:land)
   end
end




 #it 'can respond to a plane to land' do
  # expect(plane).to respond_to(:land)
#end
