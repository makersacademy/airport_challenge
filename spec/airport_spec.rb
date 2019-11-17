require 'airport'

describe Airport do
	subject { Airport.new }

		it { is_expected.to respond_to :to_land }

		it { is_expected.to respond_to :take_off }

		it { is_expected. to respond_to(:to_land).with(1).argument } # responding to method 'to_land' with '1' arugument, in this case 'plane'.

		it 'return a plane object' do # plane was instructed to land.
			plane = Plane.new
			subject.to_land(plane)
			expect(subject.take_off).to eq plane # takes off a plane, that landed before.
		end

		# raise an error to take off if there is 0 planes in the airport
		describe 'Exception of take_off' do
			it 'Error when take off plane on a empty airport' do
				expect { subject.take_off }.to raise_error "No planes to take off. Airport is empty." 
			end
		end
		# raise an error if airport is full (Default capacity - see airport.rb)
		describe 'Exception of to_land' do
			it 'Abort landing on a full airport' do
				subject.capacity.times { subject.to_land(double :plane) } # creating Doubles.
				expect { subject.to_land(Plane.new) }.to raise_error "Abort landing. Full airport."
			end
			# it 'Abort landing when Storm hapenning' do
			# 	expect { subject.to_land(Plane.new) }.to raise_error "Abort to land! Storm hapenning."
			# end
		end
		
		# describe a default capacity for Airport
		describe 'Initialization' do
			subject { Airport.new }
			let(:plane) { Plane.new }
			it 'default capacity' do
				described_class::DEFAULT_CAPACITY.times do
					subject.to_land(plane)
				end
				expect { subject.to_land(plane) }.to raise_error "Abort landing. Full airport."
			end
			it { expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY }
		end
		
		# storm
		describe 'Storm' do
			it { is_expected.to respond_to :stormy? }
			it 'STORM happening, from a scale of 1 to 10, if "random number" >= 8' do
				generator = Airport.new
				allow(generator).to receive(:rand).and_return(8) # creating Stub.
				expect(generator.stormy?).to eq(true)
			end
		end
end 
