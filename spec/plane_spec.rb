require 'plane'

describe Plane do
  it { is_expected.to respond_to(:conditions_good?) }

  it 'has good conditions to fly' do
    plane = Plane.new
    expect(plane).to be_conditions_good
  end
end
