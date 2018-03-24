require './lib/plane.rb'

describe Plane do
  it { is_expected.to respond_to :status_grounded? }
end
