require 'airport'

describe Airport do
	
	it { is_expected.to respond_to('land') }

	describe '#land' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.land). to eq plane
	end



end