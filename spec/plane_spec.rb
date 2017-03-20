require 'plane'

describe Plane do
  subject(:plane) { described_class.new }
  describe "Status of plane" do

    it "#initialization: plane is airborne when created" do
      expect(plane.status).to eq :airborne
    end

    it "#report_landing: confirms it has landed" do
      expect( plane.report_landing ).to eq :landed
    end

    it '#report_take_off: confirms it has taken off' do
      plane.report_landing
      expect( plane.report_take_off ).to eq :airborne
    end


  end

end
