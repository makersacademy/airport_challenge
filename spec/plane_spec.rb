require 'plane'

describe Plane do 
	describe '#class methods' do
		it { is_expected.to(respond_to(:land).with(1).argument) }
		it { is_expected.to(respond_to(:landed)) }
		it { is_expected.to(respond_to(:airport)) }
		it { is_expected.to(respond_to(:fly)) }
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

 	describe '#fly' do
 		it 'calling fly makes landed false' do
 			airport = double(:airport)
 			subject.land(airport)
 			subject.fly
 			expect(subject.landed).to(eq(false))
 		end

 		it 'calling fly makes plane leave airport' do
 			airport = double(:airport)
 			subject.land(airport)
 			subject.fly
			expect(subject.airport).to(eq(nil))
		end
	end	
end