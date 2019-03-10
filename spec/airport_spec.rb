require './lib/airport'
require './lib/plane'

describe Airport do
	 # let(:default_capacity) { 20 }
	describe '#land' do 
		

		it 'lands a plane' do 
			plane = Plane.new
			expect(subject.land(plane)).to eq [plane]
		end 
		#do I replace this test?

		# it 'initialize with no plane in airport' do 
		# expect()
		# end 
		it 'check if any plane in airport and returns all planes' do 
			plane = Plane.new
			subject.land(plane)
			expect(subject.check).to eq [plane]
		end 
		#maybe move this somewhere

		it 'prevents landing when weather is stormy' do
			plane = Plane.new
			subject.stormy = true 
			expect{subject.land(plane)}.to raise_error 'cannot land'
		end 

		it 'prevents landing and raises error when airport is full, if not it lands plane' do 
			# p Airport::DEFAULT_CAPACITY
			subject.default_capacity.times do 
				subject.land(Plane.new)
			end 
			# p subject.planes
			expect{subject.land(Plane.new)}.to raise_error 'Airport full'

		end 

	end 

	describe '#takeoff' do
		it 'takes off a plane and message or confirm plane is no longer in airport' do
			plane = Plane.new
			subject.land(plane)
			expect{subject.takeoff}.to output("Plane has taken off\n").to_stdout
			expect(subject.planes).to eq []
		#checks 
		end 

		it 'prevents takeoff when stormy' do 
			plane = Plane.new
			subject.land(plane)
			subject.stormy = true
			expect{subject.takeoff}.to raise_error 'cannot takeoff'
		end 
	end 

	describe '#stormy?' do 
		it 'returns weather condition, if stormy or not' do 
			expect(subject.stormy?).to eq false
		end 
	end 

	describe 'default capacity' do 
		it 'it can change default capacity' do 
			# p Airport::DEFAULT_CAPACITY
			# Airport::DEFAULT_CAPACITY = 30 
			airport = Airport.new(30)
			#sets a new airport	with default 30 capacity		
			29.times do airport.land(Plane.new)
			end 
			expect(airport.planes.count).to eq 29
		end 
	end 
end 