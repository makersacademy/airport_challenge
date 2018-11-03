require 'airport'

describe Airport do
  it { is_expected.to respond_to(:instruct_plane) }

  it 'instructs plane to land' do
    plane = Plane.new
    expect(subject.instruct_plane(plane)).to eq [plane]
  end

end
