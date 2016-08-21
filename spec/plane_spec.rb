require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it {expect(plane).to respond_to(:status)}
end
