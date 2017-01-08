require './lib/plane'

describe Plane do
  it {is_expected.to respond_to :status?}
  it {is_expected.to respond_to :landed}
  it {is_expected.to respond_to :departed}

end
