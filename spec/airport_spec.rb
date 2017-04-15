require './lib/airport'
require './lib/plane'

describe Airport do
  it { is_expected.to be_instance_of(Airport) }
  it { is_expected.to respond_to(:land_plane).with(1).argument }
  it { is_expected.to respond_to(:hangar) }
  describe '#land_plane' do
    it "lands plane safely" do
    plane = double(:plane)
    subject.land_plane(plane)
    expect(subject.hangar).to include plane
    end
  end
end
