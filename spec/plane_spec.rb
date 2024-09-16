require "plane"

describe Plane do

  it { is_expected.to be_a Plane }

  it "is expected to change state when take_off is called on plane" do
    expect(subject.take_off).to eq(false)
  end

  it "is expected to change state when land is called on plane" do
    subject.take_off
    expect(subject.land).to eq(true)
  end

  it "raises an error when land if Plane has already landed" do
    expect { subject.land }.to raise_error("Plane has already landed")
  end

  it "raises an error when take_off if Plane is already flying" do
    subject.take_off
    expect { subject.take_off }.to raise_error("Plane has already taken off")
  end
end
