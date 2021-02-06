require 'airport'

describe Airport do
  let(:subject) { Airport.new }

  it '#land allows plane to land at airport' do
    expect(subject).to respond_to(:land)
  end
end

describe Plane do
  let(:plane) { Plane.new }

  it 'plane class exists in program' do
    expect(plane).to be_a(Plane)
  end
end
