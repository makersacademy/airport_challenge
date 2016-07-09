require 'airports'

describe Airport do
  it {is_expected.to respond_to :plane_landed?}
  it {is_expected.to respond_to :land_plane}

end
