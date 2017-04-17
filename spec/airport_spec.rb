require 'airport'
require 'plane'

describe Airport do

	subject(:airport) { described_class.new(20) }
	let(:plane) { double :plane }

	describe '#land' do

		it 'instructs plane to land' do
		expect(airport).to respond_to(:land).with(1).argument
	end

	context 'when airport is full' do
	it 'raises an error' do
		20.times do
			airport.land(plane)
		end
		expect { airport.land(plane) }.to raise_error 'Airport is full'
		end
		end
	end

	describe '#take_off' do
		it 'instructs plane to take off' do
			plane = Plane.new
			subject.land(plane)
			expect(subject.take_off(plane)).to eq plane
		end
	end

	describe 'default capacity' do
		subject { Airport.new }
		let(:plane) { Plane.new }
		it 'overrides dafault capacity' do
			described_class::DEFAULT_CAPACITY.times do
			subject.land(plane)
		end
			expect{ subject.land(plane) }.to raise_error 'Airport full'
		end
	end

end
