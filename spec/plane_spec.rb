require 'plane'

describe Plane do

  describe "Status of plane" do
    it "#report_landing: confirms it has landed" do
      subject.report_landing
      expect( subject.status ).to eq "landed"
    end

    it '#report_take_off: confirms it has taken off' do
      subject.report_take_off
      expect( subject.status ).to eq "airborne"
    end

    it 'reports status of plane' do
      expect( subject.status ).to eq "airborne"
    end
  end

  describe "Loading passengers onto plane" do
    it "#load: loads passengers onto plane" do
      expect(subject.load(:passenger)).to eq [:passenger]
    end
  end
end
