require 'airport'

describe Airport do

	it {is_expected.to respond_to(:land_plane).with(1).argument}

	it 'allows something to land' do
		plane = Plane.new
		expect(subject.land_plane(plane)).to eq plane
	end

	it {is_expected.to respond_to :take_off}

	it 'allows planes to leave airport' do
		plane = Plane.new
		subject.land_plane(plane)
		expect(subject.take_off).to eq nil
	end

end