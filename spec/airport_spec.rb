require 'airport.rb'

describe Airport do

	it { is_expected.to respond_to(:stormy) }
 	
	it 'has a default capacity' do 
		expect(Airport::DEFAULT_CAPACITY).to be > 0
	end

	describe '#initialize' do

		it 'sets landed_planes to an array' do
			expect(subject.landed_planes).to eq Array.new
		end

		it 'sets capacity to DEFAULT_CAPACITY when no argument is passed' do
			expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
		end

		it 'overides DEFAULT_CAPACITY when an argument is passed' do
			expect(Airport.new(:capacity => 15).capacity).not_to eq Airport::DEFAULT_CAPACITY 
		end

		it 'defaults the weather to "clear"' do
			expect(subject.weather).to eq "clear"
		end

		it 'sets the chance_of_storm variable' do
			expect(subject.chance_of_storm).to be_kind_of(Fixnum)
		end

	end

	describe '#stormy' do 

		it 'randomly changes the weather to stormy' do
			subject.chance_of_storm = 10	
			subject.stormy 
			expect(subject.weather).to eq	"stormy"	
		end

	end

end	