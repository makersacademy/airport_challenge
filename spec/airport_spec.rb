require 'airport'

describe Airport do
	
	describe '#initialize' do
	 	it 'has a capacity of 50 planes' do
	 		expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
	 	end
	end

	describe '#land' do
		let(:plane) { double(:plane) }
		
		it {is_expected.to respond_to :land }
		
		it 'refuses to land planes if the airport is full' do
			described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
			expect {subject.land(plane)}.to raise_error("The airport is full")
		end	
	end
	
	describe '#take_off' do
		it {is_expected.to respond_to :take_off }
	end

end