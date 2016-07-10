require 'plane'

describe Plane do 
	describe '#class methods' do
		it { is_expected.to(respond_to(:land).with(1).argument) }
		it { is_expected.to(respond_to(:landed)) }
		it { is_expected.to(respond_to(:airport)) }
	end

	describe '#land' do
 		it 'calling land makes landed true' do
 			subject.land(subject) #we don't care what is passed in the land() arugment, we are just testing @land = true works in the method
 			expect(subject.landed).to(eq(true))
 		end

 		it 'calling land lands plane at airport that called it' do
 			airport = double(:airport)
 			subject.land(airport)
 			expect(subject.airport).to(eq(airport))
 		end
 	end
	
end