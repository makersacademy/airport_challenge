require 'airport'
require 'plane'

describe Plane do
  it { is_expected.to respond_to :landing?}
end
describe Airport do
  it { is_expected.to respond_to :confirm_to_land?}
  it 'gets the plane to land' do
    plane = subject.confirm_to_land?
    expect(plane).to respond_to :landing?
  end
end
