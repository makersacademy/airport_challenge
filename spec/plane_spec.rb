require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it 'should allow user to instruct a plane to take off' do
    expect(plane).to respond_to(:take_off)
  end

end
