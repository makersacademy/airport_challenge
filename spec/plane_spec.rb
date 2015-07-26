require 'plane'
require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?


describe Plane do

	it 'is flying when created' do
		expect(subject.flying?).to eq true
	end
	#First test: when the plane is created it should be flying. Then plane.flying? should be true.

	it 'can land' do
		airport = Airport.new
		expect {airport.landing (subject)}.to_not raise_error
	end
	#Second test: The plane can be used as argument in landing method, i.e. it can be landed

	it 'is not flying after landing' do
		airport = Airport.new
		airport = airport.landing (subject)
		expect(subject.flying?).to eq false
		end
	#Third test: when the plane is in the airport, it's state should be not flying, then it should respond to landed?

	it 'can not land (again) when the status is not flying' do
		airport = Airport.new
		subject.landed?
		expect {airport.landing (subject)}.to raise_error('This plane already landed')
	end
	#Fourth test: The same plane can't land a second time when it is still in the airport and not flying

	




  xit 'can land'

  xit 'can take off'

  xit 'is flying after take off'

end
