# give each plane an ascending designation, aswell as a construction time.
require 'airport_challenge'

describe Plane do
  it { is_expected.to respond_to(:designation) }
end
