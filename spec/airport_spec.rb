require 'airport'

describe Airport do

  it {is_expected.to(respond_to(:safe_to_land))}

  it {is_expected.to(respond_to(:take_off))}

end
