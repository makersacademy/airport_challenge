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

 		it 'calling land on a landed plane raises exception "Error: Plane is already landed!"' do
 			airport = double(:airport)
 			subject.land(airport)
 			expect{ subject.land(airport) }.to(raise_error("Error: Plane is already landed!"))
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

		it 'calling fly on a flying plane raises exception "Error: Plane is already flying!"' do
 			expect{ subject.fly }.to(raise_error("Error: Plane is already flying!"))
 		end
	end	
end