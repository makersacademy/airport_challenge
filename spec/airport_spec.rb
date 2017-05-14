require 'airport'

describe Airport do
  it { is_expected.to respond_to(:landing_plane).with(1).argument }
  it { is_expected.to respond_to :planes }

  it "Set capacity of planes when new airport made"do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  plane = Plane.new
  it "Allows a plane to land" do
    expect(subject.landing_plane(plane)).to eq [plane]
  end

  let(:plane) { double :plane }
  it "Raises an error if at capacity" do
    Airport::Default_capacity.times {subject.landing_plane double(:plane) }
    expect {subject.landing_plane double(:plane) }.to raise_error "No space currently available"
  end

  plane = Plane.new
  it "Allows plane to take off" do
    except(subject.take_off(plane)).to eq plane
  end


end
