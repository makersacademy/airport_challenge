require 'plane'

describe Plane do

  it {is_expected.to(respond_to(:can_land))}

  it {is_expected.to(respond_to(:can_take_off))}

end
