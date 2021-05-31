require "airport"

describe Airport do

  before do
    @plane = Plane.new
  end

  it { is_expected.to be_instance_of Airport }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "lands a plane" do
    expect(subject.land(@plane)).to eq([@plane])
  end

  it "returns the landed planes" do
    subject.land(@plane)
  end
  

  it { is_expected.to respond_to(:take_off).with(1).argument }

end
