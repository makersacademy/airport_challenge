require 'plane'

describe Plane do
  subject(:plane) {Plane.new}

  it 'return true' do
    expect(plane.takeoff?).to be_truthy
  end

  it 'return true' do
    expect(plane.landed?).to be_truthy
  end
end
