require 'Airport'

describe Airport do
	# test being able to land plane at airport
	it 'reponds to land_plane' do
		expect(subject).to respond_to :land_plane
	end

	# test plane being accepted at airport
	it 'reponds to accept_plane' do
		expect(subject).to respond_to :accept_plane
	end

end