require "plane"

describe Plane do
  subject(:plane_grounded) { described_class.new }
  subject(:plane_flying) { described_class.new("B",true) }

  describe "tests:" do

    it { is_expected.to respond_to(:flying?) }

    it "should be considered landed once landed" do
      plane_flying.report_landed
      expect(plane_flying.flying?).to eq(false)
    end

    it "should be considered flying once taken off" do
     plane_grounded.report_flying
      expect(plane_grounded.flying?).to eq(true)
    end

  end
  
end    
