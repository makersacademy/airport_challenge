require './docs/plane.rb'

describe Plane do
  it { is_expected.to respond_to :working? }
end
