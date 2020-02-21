require 'airport'
# line 1 is to require the access to the lib airport ruby file
describe Airport do
 it  { is_expected.to respond_to :land }
# the airport is expected to respond to the method take_off, take_off colons so this is not going to change
 describe '#landed' do
   it 'can not land when airport is full' do
     5.times { subject.land Plane.new }
     expect { subject.land Plane.new }.to raise_error "Airport full, do not land"
   end
 end

 it 'lands a flying plane' do
  plane = Plane.new
  subject.land(plane)
  expect(subject.land).to eq plane
  # the airport needs to land a flying plane, the plane needs to land, i expect the plane to be landing.
end

 it 'instructs a plane to take off' do
   plane = Plane.new
   subject.take_off(plane)
  expect(subject.take_off).to eq plane
  # the airport needs to tell the plane to fly, tells it take_off, i expect the plane to be flying.
 end
end
