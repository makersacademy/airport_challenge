require 'airport'

describe Airport do

  it "gets a plane" do
    expect(subject.get_plane).to be_kind_of Plane
  end

  it 'responds to .plane' do
    expect(subject).to respond_to :plane
  end

  it 'lands a Plane and can return the same Plane' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

end
