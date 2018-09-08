require 'airport'
require 'plane'

describe Airport do
  # desribe '#land_plane' do - add in nested desribe statements for each method
  it { is_expected.to respond_to(:land).with(1).argument }

  # describe #stormy weather so plane cannot land"
   it 'does not let the plane land in stormy weather' do
     
   end
  # old 'lands a plane test'
  # it 'lands a plane' do
  #   plane = Plane.new
  #   expect(Airport.new.land(plane)).to eq("Plane has landed")
  # end

  # describe '#grounded_planes' do
  it "stores landed planes in a list" do
  expect(Airport.new.grounded_planes).to be_a(Array)
  end

  it "registers that a landed plane has been stored" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.grounded_planes).to eq([plane])
  end

  # desrcibe '#takeoff(plane)'
  it { is_expected.to respond_to(:takeoff).with(1).argument }

  it 'confirms that the plane is no longer at the airport' do
    plane = Plane.new
    subject.takeoff(plane)
    expect(subject.grounded_planes).to eq([]), "Plane has taken off"
  end


end
