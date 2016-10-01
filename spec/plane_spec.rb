require 'plane'

describe Plane do

  it {is_expected.to respond_to :flying?}

  it {is_expected.to respond_to :status?}

end
