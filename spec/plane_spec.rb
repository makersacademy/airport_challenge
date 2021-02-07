require 'plane'

describe Plane do
  let(:plane) { Plane.new }

  it 'plane class exists in program' do
    expect(plane).to be_a(Plane)
  end
end
