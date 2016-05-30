require 'spec_helper'
require 'plane'

describe Plane do
	subject(:plane) { described_class.new }

# planes can only take off from airports they are in; 
# planes that are already flying cannot take off; 
# planes that are already flying cannot be in an airport; 
# planes that are landed cannot land again 
# planes that are landed cannot be flying 
# planes that are landed must be in an airport 

it 'can\'t take off from an airport, unless it is currently in that airport' do
	plane = Plane.new 
	plane.tookoff = true
	planes = subject.planes << plane
	expect(subject.takeoff(planes[-1])).to eq true
end

it 'can\'t take off if it has already taken off' do

end

it 'can\'t *have taken off* if it is currently in an airport' do

end

it 'can\'t *have taken off* if it is currently landed' do

end

it 'can\'t land at an airport, if it is currently in that airport' do
	plane = Plane.new 
	plane.tookoff = true
	planes = subject.planes << plane
	expect(subject.takeoff(planes[-1])).to eq true
end

it 'can\'t land if it is hasn\'t already taken off' do

end

it 'can\'t *have landed* if it is not currently in an airport' do

end

it 'can\'t be landed & taken-off at the same time' do

end


# planes that are landed cannot land again 
# planes that are landed cannot be flying 
# planes that are landed must be in an airport 
end
