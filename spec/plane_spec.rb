require 'plane'

describe Plane do
  let(:plane) { double :plane }
  let(:flying) { double :flying }

  it { should respond_to(:take_off) } 
  it { should respond_to(:land) } 

end
 