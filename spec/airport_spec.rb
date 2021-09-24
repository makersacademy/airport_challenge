require 'airport'

describe Airport do
  it { is_expected.to respond_to :instruct_plane }

  it 'instructs a plane to land' do
    plane = subject.instruct_plane
    expect(plane).to be_landing
  end
end