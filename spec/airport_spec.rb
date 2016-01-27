require 'airport'

describe Airport do
	
	subject(:airport) {described_class.new(20)}
	let(:airport) {double :plane}
	
	airport = Airport.new

	describe '#basic tests' do

		it 'returns an instance of airport' do
		expect(airport).to be_a(Airport)
		end

		it {is_expected.to respond_to(:land).with(1).argument}   #land method in class Airport

		it {is_expected.to respond_to(:planes_landed)}  #planes_landed method in class Airport

		it {is_expected.to respond_to(:taken_off).with(1).argument}  #taken_off method in class Airport

	end

	describe '#landing' do
		
		context 'when not stormy' do

			before do
				allow(airport).to receive(:stormy?).and_return false
			end

				it 'lands a plane' do				
					expect(subject.land(plane)).to eq [plane]  #land method in class Airport
				end

				it 'confirms plane has landed' do
					subject.land(plane)
					expect(subject.planes_landed).to eq [plane]  #planes_landed method in class Airport	
				end

				context 'when full' do #use context for 'when' + 'full' instead of at at capacity, to follow user story
					
					it 'raises an error' do
						20.times do
							airport.land(plane)
						end
						expect{airport.land(plane)}.to raise_error 'Cannot land plane: airport full.  Take off a plane first.'
					end
				end
		end

		context 'when stormy' do

			it 'raises an error if asked to land a plane when stormy' do
				allow(airport).to receive(:stormy?).and_return true
				expect{airport.land(plane)}.to raise_error 'Cannot land plane: weather is stormy.'
			end
		end
	end

	describe '#taking off' do

		it 'confirms plane has taken off' do
			subject.taken_off(plane)
			expect(subject.taken_off(plane)).to eq (plane)  #planes_takenoff method in class Airport	
		end
	end


end

#why needed () around plane in 'confirms plane has taken off' test?


