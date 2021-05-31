require "airport"

describe Airport do

  it { is_expected.to be_instance_of Airport }

  it { is_expected.to respond_to(:land).with(1).argument }

  it "lands a plane" do
    expect(subject.land(@plane)).to eq [@plane]
  end

  it "returns planes present at airport" do
    subject.land(@plane)
  end
  

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "takes off a plane" do
    expect(subject.take_off(@plane)).to eq []
  end

  it "returns planes present at airport" do
    subject.take_off([@plane])
  end

end
