require 'plane'

describe Plane do 
	it 'A new plane taking off should be flying' do 
		expect(subject).to be_flying
	end

	it 'A plane can be told to land' do 
		subject.land
		expect(subject).to_not be_flying
	end

	it 'A plane must be flying when taking off' do 
		subject.take_off
		expect(subject).to be_flying
	end
end