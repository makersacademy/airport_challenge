require './lib/plane.rb'
@plane = Plane.new

describe Plane do
  it { is_expected.to respond_to: working? }


end
 # need to have a working plane for actions to be taken
