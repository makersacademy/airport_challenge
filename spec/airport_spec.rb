require 'airport'
require 'plane'

describe Plane do
  it { is_expected.to respond_to :landing?}
  it { is_expected.to respond_to :taken_off?}
end
describe Airport do
  it { is_expected.to respond_to :confirm_to_land?}
  it 'gets the plane to land' do
    plane = subject.confirm_to_land?
    expect(plane).to respond_to :landing?

  end

  it 'confirms that the plan is not in the airport' do
    plane = Plane.new
    subject.not_in_airport(plane)
    expect(subject.not_in_airport(plane)).to eq plane
  end
end
