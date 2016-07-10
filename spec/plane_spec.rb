require "plane"

describe Plane do
  subject(:plane) { described_class.new }

  it {is_expected.to(respond_to(:landed))}
    

end
