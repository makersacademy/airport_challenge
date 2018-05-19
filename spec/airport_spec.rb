require 'airport'

describe Airport do
  let(:plane) { double :plane }

  describe '#land' do
	it 'lands something' do
		expect(subject.land(plane).last).to eq plane
	end

	it 'raises an error when the airport is full' do
		subject.capacity.times { subject.land plane }
		expect { subject.land plane }.to raise_error 'Airport is full!'
	end

  end

  it 'has a default capacity' do
	expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end


end
