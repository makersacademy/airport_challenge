require "plane"
require "airport"

describe Plane do
    subject(:plane_grounded) { described_class.new }
    subject(:plane_flying) { described_class.new(true) }
    let(:airport) { double(:airport) }
    
    describe "tests:" do
        it {is_expected.to respond_to(:flying?)}
   
    end



end

    