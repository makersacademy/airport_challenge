require 'airport'

describe Airport do
	
	describe '#initialize' do
	 	it 'has a default capacity of 50 planes' do
	 		expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
	 	end
	end

	describe '#land' do
		#let(:plane) { double(:plane) }
		it {is_expected.to respond_to :land }
		
		it 'refuses to land planes if the airport is full' do
			plane = double(:plane, landed: false)
			described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
			expect {subject.land(plane)}.to raise_error("The airport is full")
		end
		
		# it 'refuses to land planes if weather is stormy' do
		# 	expect {subject.land(plane)}.to raise_error("There is a storm")
		# 	expect {subject.land(plane)}.not_to raise_error
		# end
	end
	
	describe '#take_off' do
		#let(:plane) { double(:plane) }
		it {is_expected.to respond_to(:take_off).with(1) }

		it 'refuses to take off a plane that is flying' do
			#plane = double(:plane, fly: true)
			allow(plane).to receive(:fly).and_return(true)
			expect {subject.take_off(plane)}.to raise_error("A flying plane cannot take off as it is not in this airport")
		end
	end

end