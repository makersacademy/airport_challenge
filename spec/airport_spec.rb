require 'airport'
require 'plane'

describe Airport do
it {is_expected.to respond_to :land}
it 'plane lands and airport confirms landing' do
airport = Airport.new
plane = Plane.new
expect(subject.land(plane)).to eq "The plane #{plane} has landed"
end

end
