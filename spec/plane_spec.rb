require 'plane'
require 'airport'

describe Plane do
    
    subject(:plane) {described_class.new}
    let(:airport) { double :airport }
    
    it { is_expected.to respond_to(:landed?) }
    
   



end