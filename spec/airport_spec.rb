require 'airport'
# line 1 is to require the access to the lib airport ruby file
describe Airport do
 it  { is_expected.to respond_to :land }
# the airport is expected to respond to the method take_off, take_off colons so this is not going to change
 it 'lands a flying plane' do
  plane = subject.land
  expect(plane).to be_landed
 end
end
# the airport needs to land a flying plane, the plane needs to land, i expect the plane to be landing.
