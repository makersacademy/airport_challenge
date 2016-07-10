require 'plane'

describe Plane do 
	describe '#class methods' do
		it { is_expected.to(respond_to(:land)) }
		it { is_expected.to(respond_to(:landed)) }
	end

	describe '#land' do
 		it 'land makes landed true' do
 			subject.land
 			expect(subject.landed).to(eq(true))
 		end
 	end
	
end