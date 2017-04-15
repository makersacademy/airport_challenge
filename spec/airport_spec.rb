require 'airport'
require 'plane'

describe Airport do
	
	describe '#land'
	it 'instructs plane to land' do
		plane = Plane.new
		expect(subject.land(plane)).to eq plane
	end

	describe '#take_off'
	it 'instructs plane to take off' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.take_off).to eq plane
	end

end
