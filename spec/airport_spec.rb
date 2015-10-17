require 'airport'

describe Airport do
	
	describe '#initialize' do
	 	it 'has a capacity of 50 planes' do
	 		expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
	 	end
	end

	describe '#host' do
		#let(:plane) { double(:plane) }
		it 'refuses to host planes if the airport is full' do
			plane = double(:plane, land: true)
			described_class::DEFAULT_CAPACITY.times { subject.host(plane) }
			expect {subject.host(plane)}.to raise_error("The airport is full")
		end	
	end
end