require 'airport'
require 'plane'

describe Airport do
  it { expect(subject.land).to be_a Plane}
end
