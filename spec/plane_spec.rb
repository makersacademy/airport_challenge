require 'plane'

describe Plane do

  it "should be flying when first created" do
    expect(subject.status).to eq "In the air"
  end

  describe '#land' do

    it "shouldnt be able to land if it is on the ground" do
      airport = double(:airport, plane_expected?: true)
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error "Plane is already on the ground"
    end

    it "should be able to land at a specific airport" do
      airport = double(:airport, plane_expected?: true)
      subject.land(airport)
      expect(subject.status).to eq airport
    end

    it "checks a plane has been expected before landing it" do
      airport = double(:airport, plane_expected?: true)
      expect(airport).to receive(:plane_expected?).with(subject)
      subject.land(airport)
    end

  end

  describe '#takeoff' do

    it "shouldnt be able to take off if already in the air" do
      expect { subject.takeoff }.to raise_error "Plane is already in the air"
    end

    it "should be in the air after taking off" do
      airport = double(:airport, plane_expected?: true, on_runway?: true)
      subject.land(airport)
      subject.takeoff
      expect(subject.status).to eq "In the air"
    end

    it "should check the plane is on the runway before letting it take off" do
      airport = double(:airport, on_runway?: true, plane_expected?: true)
      subject.land(airport)
      expect(airport).to receive(:on_runway?).with(subject)
      subject.takeoff
    end


  end

end
