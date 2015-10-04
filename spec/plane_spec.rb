require 'plane'

describe Plane do

	let (:plane) {Plane.new :destination}

	it 'is flying when created' do
		expect(plane).to be_flying
	end

	it 'can land' do
		plane.land
		expect { plane.land }.to raise_error 'Can not land if plane is not flying'
	end

	it 'is landed after landing' do
		plane.land
		expect(plane).to be_landed
	end

	it 'can take off' do
		plane.land
		plane.take_off
		expect { plane.take_off }.to raise_error 'Can not take off if plane is already flying'
	end

	it 'is flying after take off' do
		plane.land
		plane.take_off
		expect(plane).to be_flying
	end
end
