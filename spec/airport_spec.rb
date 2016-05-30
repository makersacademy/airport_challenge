require 'spec_helper'
require 'airport'

describe Airport do
	subject(:airport) { described_class.new }

	it 'instructs a plane to take off' do
		plane = Plane.new 
		plane.tookoff = true
		expect(subject.takeoff(plane)).to eq true
	end

	it 'gets confirmation that *the plane* it instructed to take off, has taken off' do
		plane = Plane.new 
		plane.tookoff = true
		planes = subject.planes << plane
		expect(subject.takeoff(planes[-1])).to eq true
	end

	it 'instructs a plane to land' do
		plane = Plane.new
		plane.landed = true

		expect(subject.land(plane)).to eq true
	end

	it 'gets confirmation that *the plane* it instructed to land, has landed' do
		plane = Plane.new
		plane.landed = true
		planes = subject.planes << plane

		expect(subject.land(planes[-1])).to eq true
	end
	
end