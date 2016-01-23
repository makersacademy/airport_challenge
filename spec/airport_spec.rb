require 'airport'

describe Airport do
	it {is_expected.to respond_to(:release_plane)}

	it 'releases_plane' do
		plane = subject.release_plane
		expect(plane).to be_airborne
	end

	it {is_expected.to respond_to(:land).with(1).argument}

	it 'returns landed planes' do
		plane = Plane.new
		subject.land(plane)
		expect(subject.plane).to eq(plane)
	end

end
	