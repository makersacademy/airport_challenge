require 'plane'

describe Plane do

  describe "Status of plane" do
    it "#report_landing: confirms it has landed" do
      subject.report_landing
      expect( subject.status ).to eq "landed"
    end
  end

  describe "Loading passengers onto plane" do
    it "#load: loads passengers onto plane" do
      expect(subject.load(:passenger)).to eq [:passenger]
    end
  end
end
