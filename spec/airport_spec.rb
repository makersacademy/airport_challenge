require 'airport'
require 'plane'

describe Airport do

	describe '#land'
	it 'instructs plane to land' do
		plane = Plane.new
		expect(subject.land(plane)).to include plane
	end
	it 'raises an error when airport is full' do
		5.times { subject.land Plane.new }
		expect { subject.land Plane.new }.to raise_error 'Airport is full'
	end



	describe '#take_off'
	it 'instructs plane to take off' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.take_off(plane)).to eq plane
	end


	describe 'default capacity' do
		subject { Airport.new }
		let(:plane) { Plane.new }
		it 'overrides dafault capacity' do
			described_class::DEFAULT_CAPACITY.times do
			subject.land(Plane.new)
		end
			expect{ subject.land(plane) }.to raise_error 'Airport is full'
		end
	end

end
