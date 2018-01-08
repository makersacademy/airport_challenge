require 'plane'

describe Plane do
  subject(:plane) { described_class.new }

  it 'a plane exists' do
    expect(plane).to be_instance_of(Plane)
  end

end
