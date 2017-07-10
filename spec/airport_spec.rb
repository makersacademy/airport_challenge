require 'plane'
require 'airport'

describe Airport do

	it 'responds to #land' do
		expect(subject).to respond_to :land
	end

	it 'responds to #takeoff' do
		expect(subject).to respond_to :takeoff
	end

	it 'prevents #takeoff when weather is stormy' do
		if :stormy?
		expect { airport.land(plane) }.to raise_error 'Due to inclement weather, landing is not permitted'
		end
	end

	it 'prevents #landing when the airport is full' do
		

end