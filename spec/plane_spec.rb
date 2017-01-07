require 'plane'

describe Plane do

  it { is_expected.to respond_to :landed_status }

  it "should have a default landed_status of 'Airbourne'" do
    expect(subject.landed_status).to eq "Airbourne"
  end

  it { is_expected.to respond_to(:change_status).with(1).argument}

  describe "#change_status" do

    it "should be able to change the plane status from 'Airbourne' to 'Landed'" do
      subject.change_status("Landed")
      expect(subject.landed_status).to eq "Landed"
    end

    it "should be able to change the plane status from 'Landed' to 'Airbourne'" do
      plane = Plane.new("Landed")
      plane.change_status("Airbourne")
      expect(plane.landed_status).to eq "Airbourne"
    end
  end
end
