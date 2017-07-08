require 'plane'
describe Plane do
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to :landed? }
  it { is_expected.to respond_to :takeoff }
  it { is_expected.to respond_to :left_airport? }

end
