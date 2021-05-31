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

  it "raises an error when airport is full" do
    Airport::DEFAULT_CAPACITY.times do
      subject.land(Plane.new)
    end
    expect { subject.land(Plane.new).to raise_error "Airport is full" }
  end

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "takes off a plane" do
    expect(subject.take_off(@plane)).to eq []
  end

  it "returns planes present at airport" do
    subject.take_off([@plane])
  end

end
