require 'airport'

describe Airport do

	it {is_expected.to respond_to(:land_plane).with(1).argument}

end