require 'Airport'

describe Airport do
	it 'reponds to land_plane' do
		expect(subject).to respond_to :land_plane
	end
end