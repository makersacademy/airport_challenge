require 'plane.rb'
describe Plane do
  it { is_expected.to respond_to :plane_landed }
  it { is_expected.to respond_to :plane_flying? }
  it { is_expected.to respond_to :plane_takeoff }
end
