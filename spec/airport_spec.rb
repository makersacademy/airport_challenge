require 'airport'


describe Airport do
# this is for the landing_plane method in airport.rb

  it { is_expected.to respond_to :land_plane }
  it { is_expected.tp respond_to :take_off_plane }

  # it {is_expected.to respond_to(:land).with(1).argument }

  it "land a plane" do
    plane = subject.land_plane
    expect(plane).to be_landed
  end
end
