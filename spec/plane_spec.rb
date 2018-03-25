require 'plane.rb'

describe Plane do
  it "is expected to respond to :in_airport?" do
    is_expected.to respond_to(:in_airport?)
  end
end
