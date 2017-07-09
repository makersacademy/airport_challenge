require 'plane'
require 'airport'

describe Airport do

	it 'responds to #land' do
		expect(subject).to respond_to :land
	end

	it 'responds to #takeoff' do
		expect(subject).to respond_to :takeoff
	end

end