require 'Airport'

describe Airport do
	
	let(:plane) { double(:plane)}

	describe '#land' do

		it 'expects an argument of (plane) so it knows which to land' do
			expect { (subject.land).with(no_args) }.to raise_error ArgumentError 
		end

		it 'instructs the plane to land' do
			expect(subject.land(plane)).to eq "plane landed"
		end

		it 'should return an error if already landed'

		it 'cannot land if airport full'

		it 'cannot land if weather stormy'

	end

	describe '#takeoff' do

		it 'expects an argument of (plane) so it knows which to release' do
			expect { (subject.takeoff).with(no_args) }.to raise_error ArgumentError 
		end

		it 'instructs a plane to takeoff' do
			expect(subject.takeoff(plane)).to eq "plane taken off"
		end

		it 'cannot takeoff if weather stormy'

		it 'cannot takeoff if the plane is not at that airport (e.g. empty)'

	end

end