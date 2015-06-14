require 'plane'

describe Plane do 
  it "Takes off" do
    airport = double( :airport )
    expect( airport ).to receive :notified_take_off
  end
end

