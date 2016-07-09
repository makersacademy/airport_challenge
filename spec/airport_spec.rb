require 'airport'
require 'plane'

describe Airport do
it {is_expected.to respond_to :land}
it {is_expected.to respond_to(:land).with(1).argument }
it 'instructs a plane to land and airport confirms landing' do
plane = Plane.new
expect(subject.land plane).to eq "The plane #{plane} has landed"
end
it {is_expected.to respond_to :take_off}
it {is_expected.to respond_to(:take_off).with(1).argument}
it 'instructs a plane to take off and confirms it' do
  plane = Plane.new
  subject.land plane
  expect(subject.take_off plane).to eq "The plane #{plane} has taken off"
end
it 'when a plane took off from airport it confirms that plane is no longer in airport' do
plane = Plane.new
subject.land plane
subject.take_off plane
expect(subject.planes.map{|x| x if x == plane}.empty?).to be true
end
end
