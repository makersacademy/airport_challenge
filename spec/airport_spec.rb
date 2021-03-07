require './lib/airport.rb'

describe Plane do
	it 'testing plane object exists' do
		expect(Plane).to be(Plane) #is there a way to make expect(subject).to be(Plane.new) work?
	end
end

describe Airport do
	it 'testing Airport allows landing' do
		expect(subject).to respond_to :land
	end

	it 'testing plane object can land' do
		plane = Plane.new
		expect(subject.land(plane)).to eq(plane)
	end
end