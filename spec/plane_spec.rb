require 'plane'

describe Plane do

  describe "Status of plane" do

    it "#initialization: plane is landed when created" do
      expect(subject.status).to eq :landed
    end

    it '#report_take_off: confirms it has taken off' do
      expect( subject.report_take_off ).to eq :airborne
    end

    it "#report_landing: confirms it has landed" do
      subject.report_take_off
      expect( subject.report_landing ).to eq :landed
    end
  end

end
