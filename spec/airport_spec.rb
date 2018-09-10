require 'airport'

describe Airport do

  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to(:take_off).with(1).argument }

  it "raises an error when stormy" do
    allow(subject).to receive(:stormy?) { true }
    expect { subject.take_off(Plane.new) }.to raise_error 'Too stormy'
  end

  it "creates a variable for storage" do
    expect(subject.storage).to eq []
  end

  it "should add a plane to storage when lands" do
    first_plane = Plane.new
    expect(subject.land(first_plane)).to eq [first_plane]
  end

  it "should remove the plane from storage when take off" do
    second_plane = Plane.new
    allow(subject).to receive(:stormy?) { false }
    expect(subject.take_off(second_plane)).to eq []
  end
end
