require 'plane'

describe Plane do
  subject(:plane) {Plane.new}
  # it { is_expected.to respond_to(:takeoff?) }
  # it { is_expected.to respond_to(:landed?) }

  it 'return true' do
    expect(plane.takeoff?).to be_truthy
  end

  it 'return true' do
    expect(plane.landed?).to be_truthy
  end
end
