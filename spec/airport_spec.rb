require 'airport'

describe Airport do

	it 'responds to land_plane' do
		expect(subject).to respond_to :land_plane
	end

	it 'lands planes'
		subject.land_plane
		expect(plane).to be_landed?
	end



end