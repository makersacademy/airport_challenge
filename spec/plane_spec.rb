require 'plane'
describe Plane do
  it { is_expected.to respond_to :flying }
  it { is_expected.to respond_to :arrived }
  it { is_expected.to respond_to :departed }
end
