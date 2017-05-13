require 'plane'

describe Plane do
  it "responds to #flying?" do
    is_expected.to respond_to(:flying?)
  end
end
