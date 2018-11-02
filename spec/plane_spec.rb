require 'plane'

describe Plane do
  it { expect(subject).to respond_to(:land).with(1) }
  it { expect(subject).to respond_to(:take_off) }
end
