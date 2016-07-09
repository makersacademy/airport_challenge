require 'airport'
require 'plane'

describe Airport do
it {is_expected.to respond_to :land}
it {is_expected.to respond_to(:land).with(1).argument }
it 'instruct a plane to land and airport confirms landing' do
airport = Airport.new
plane = Plane.new
expect(subject.land(plane)).to eq "The plane #{plane} has landed"
end

end
