require 'airport'
require 'weather'
require 'plane'

describe Airport do

	it { is_expected.to respond_to(:land).with(1).argument }
	it { is_expected.to respond_to(:take_off).with(1).argument }

	it 'accepts flying plane' do
		plane = Plane.new
		expect(subject.land(plane)).to eq "Welcome to London"
	end

	# it 'allows plane to take off' do
	# 	plane = Plane.new
	# 	!plane.plane_flying?
	# 	expect(subject.take_off(plane)).to eq "Have a pleasant flight"
	# end

	it 'allows landed plane to take off again' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.take_off(plane)).to eq "Have a pleasant flight"
	end

	########### AFTER LANDING ##########

	it 'has the plane after landing' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.in_airport?(plane)).to eq true
	end

	it 'does not have plane after takeoff' do
		plane = Plane.new
		subject.land(plane)
		subject.take_off(plane)
		expect(subject.in_airport?(plane)).to eq false
	end

	######## BAD WEATHER #############

	# it 'cannot land the plane in a storm' do
	# 	plane = Plane.new
	# 	weather = Weather.new
	# 	weather.stormy?
	# 	expect {subject.land(plane)}.to raise_error("Unable to land in a storm")
	# end

	# it 'it does not have the plane due to storm' do
	# 	plane = Plane.new
	# 	weather = Weather.new
	# 	weather.stormy? == true
	# 	subject.land(plane)
	# 	expect(subject.in_airport?(plane)).to eq true
	# end

	# it 'plane did not land so it cannot take off again' do
	# 	plane = Plane.new
	# 	weather = Weather.new
	# 	weather.stormy? == true
	# 	subject.land(plane)
	# 	expect {subject.take_off(plane)}.to raise_error("Plane did not arrive due to storm")
	# end

	# it 'can land when the weather is fine' do
	# 	plane = Plane.new
	# 	weather = Weather.new
	# 	weather.stormy? == false
	# 	expect(subject.land(plane)).to eq "Welcome to London"
	# end

end








