require 'plane'

describe Plane do

  it { should respond_to(:land_at).with(1).argument }

  it { should respond_to(:take_off_from).with(1).argument}
end