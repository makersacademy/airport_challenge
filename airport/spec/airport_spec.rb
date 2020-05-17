require 'airport'

describe Airport do

  # test for land method for Airport
  it { is_expected.to respond_to :land }
  it { is_expected.to respond_to(:land).with(1).argument}
  describe "#land" do
    it "land a plane in airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end

    xit "raise an error when full" do
      subject.land(Plane.new)
      expect(subject.land(Plane.new)).to raise_error "airport is full"
    end
  end

 # test for showing landed plane method for Airport
  it { is_expected.to respond_to :plane}

  it "show landed planes" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

 # test for take_off method for Airport
  it { is_expected.to respond_to :take_off }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "send a message to confirm take off" do
    plane = Plane.new
    expect(subject.take_off(plane)).to eq "#{plane} is no longer in the airport"
  end


end
