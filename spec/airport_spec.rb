require 'airport'
require 'plane'

describe Airport do
  # desribe '#land_plane' do - add in nested desribe statements for each method
  it { is_expected.to respond_to :land_plane}

  it 'lands a plane' do
    expect(Airport.new.land_plane).to eq("Plane has landed")
  end

  # describe '#grounded_planes' do
  # it "stores planes in the hangar" do
  # expect(Airport.new.grounded_planes).to be_a(Array)
  # end

  # desrcibe '#takeoff(plane)'
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'allows plane to takeoff' do
    plane = Plane.new
    expect(Airport.new.takeoff(plane)).to eq("Plane has taken off")

  end


end
