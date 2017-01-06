require 'airport'

describe Airport do

	it {is_expected.to respond_to(:land_plane).with(1).argument}
	
	it {is_expected.to respond_to :take_off}

	describe '#land_plane' do
		it 'allows something to land' do
			plane = Plane.new
			expect(subject.land_plane(plane)).to eq plane
		end
	end

	describe '#take_off' do
		it 'allows planes to leave airport' do
			plane = Plane.new
			subject.land_plane(plane)
			expect(subject.take_off).to eq nil
		end
	end

end