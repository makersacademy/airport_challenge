require 'airport'

describe Airport do

  it "gets a plane" do
    expect(subject.get_plane).to be_kind_of Plane
  end

  it 'responds to .plane' do
    expect(subject).to respond_to :plane
  end

  it 'returns a plane when .plane is called' do
    expect(subject.plane).to be_kind_of Plane
  end

end
