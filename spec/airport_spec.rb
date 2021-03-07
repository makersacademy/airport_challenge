require './lib/airport.rb'

describe Plane do
	it 'Does plane object exist' do
		expect(Plane).to be(Plane) #is there a way to make expect(subject).to be(Plane.new) work?
	end
end

describe Airport do
	it 'Does Airport allows landing' do
		expect(subject).to respond_to :land
	end

	it 'Can plane object land' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.plane).to eq(plane)
	end

	it 'Can plane be instructed to take off' do
		expect(subject).to respond_to :take_off
	end

	it 'When a plane takes off, does Airport confirm it is no longer there' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.take_off).to eq(plane)
	end
end