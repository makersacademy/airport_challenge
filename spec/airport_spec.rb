require 'airport'

describe Airport do
	# subject(:airport) { described_class.new }
  	let(:plane) { double :plane }

	it { is_expected.to respond_to(:land).with(1).argument }
	it { is_expected.to respond_to(:take_off).with(1).argument }
	it { is_expected.to respond_to(:planes) }
	it { is_expected.to respond_to(:contains?).with(1).argument }
	it { is_expected.to respond_to(:capacity) }

	describe '#land' do
		it 'instructs a plane to land at airport' do
			subject.land(plane)
			expect(subject.planes).to eq([plane])
		end
		it 'it parks a landed plane at airport' do
			subject.land(plane)
			expect(subject.planes.include?(plane)).to be(true)
		end
		it 'raises error when a plane tries to land at a full airport with default capacity' do
			Airport::DEFAULT_CAPACITY.times { subject.land(plane) }
			expect { subject.land(plane) }.to raise_error("Airport full")
		end
		it 'raises error when a plane tries to land at a full airport with manual capacity' do
			capacity = (1..100).to_a.sample
			airport = described_class.new(capacity)
			capacity.times { airport.land(plane) }
			expect { airport.land(plane) }.to raise_error("Airport full")
		end
	end

	describe '#take_off' do
		it 'it instructs a plane to take off from the airport' do
			subject.land(plane)
			expect(subject.take_off(plane)).to eq(plane)
		end
		it 'removes a plane that has left from the airport' do
			subject.take_off(plane)
			expect(subject.planes.include?(plane)).to be(false)
		end
	end

	describe 'set airport capacity' do
		it 'a new airport has a default capacity' do
			expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    	end
    	it 'the capacity of a new airport can be manually set' do
    		capacity = (1..100).to_a.sample
    		airport = described_class.new(capacity)
			expect(airport.capacity).to eq(capacity)
    	end

	end

		describe '#contains?' do
		it 'returns true when plane is in the airport' do
			subject.land(plane)
			expect(subject.contains?(plane)).to be(true)
		end
		it 'returns false when airport is empty' do
			expect(subject.contains?(plane)).to be(false)
		end
		it 'returns false when specific plane is not in airport' do
			subject.land(plane)
			another_plane = double(:plane)
			expect(subject.contains?(another_plane)).to be(false)
		end
	end

end