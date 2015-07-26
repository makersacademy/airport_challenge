require 'plane'
require 'airport'

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
		airport.landing (subject) 
		expect(subject.flying?).to be false
		end
	#Third test: when the plane is in the airport, it's state should be not flying, then it should respond to landed?

	it 'can not land (again) when is not flying' do
		airport = Airport.new
		subject.landed?
		expect {airport.landing (subject)}.to raise_error('This plane has already landed')
	end
	#Fourth test: The same plane can't land a second time when it is still in the airport and not flying

	it 'can take off' do
		airport = Airport.new
		expect {airport.take_off (subject)}.to_not raise_error
	end
	#Fifth test: The plane, after landing, can take off the airport.

	it 'is flying after taking off' do
		airport = Airport.new
		airport = airport.take_off (subject)
		expect(subject.flying?).to eq true
	end
	#Sixth test: The plane is flying after taking off

	it 'can not take off (again) when it is already flying' do
		airport = Airport.new
		subject.departed?
		expect {airport.take_off (subject)}.to raise_error('This plane has already departed')
	end
	#Seventh test: The same plane can't take off a second time when it's already flying



end
