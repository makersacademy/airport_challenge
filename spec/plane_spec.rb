require 'plane'

describe Plane do 
	it 'response to landed and returns true' do
	expect(subject.landed?).to eq true
	end

	it 'reports that is has taken off' do 
	expect(subject.taken_off).to eq true
	end
	
end