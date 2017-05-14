require 'airport'

describe Airport do
  it { is_expected.to respond_to(:landing_plane).with(1).argument }
  it { is_expected.to respond_to :planes }

  it "Set capacity of planes when new airport made"do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  plane = Plane.new
  it "Allows a plane to land" do
    expect(subject.landing_plane(plane)).to eq true
  end

  it "doesn't allow planes to land or takeoff in bad weather" do
    expect(subject.weather).to eq "Apologies due to bad weather you'll not be able to land!"
  end

  describe 'landing_plane' do
    let(:plane) {double :plane}
    it "Raises an error if at capacity" do
      Airport::Default_capacity.times {subject.landing_plane double(:plane) }
      expect {subject.landing_plane double(:plane) }.to raise_error "No space currently available"
    end
  end

end
