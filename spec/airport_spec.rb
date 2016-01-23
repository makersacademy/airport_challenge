require 'airport'

describe Airport do
	it {is_expected.to respond_to(:release_plane)}

	it 'releases_plane' do
		plane = subject.release_plane
		expect(plane).to be_airborne
	end

end
	