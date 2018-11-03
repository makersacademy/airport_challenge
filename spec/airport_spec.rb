require 'airport'

describe Airport do
  it { is_expected.to respond_to(:instruct_plane_land) }

  it 'instructs plane to land' do
    plane = Plane.new
    expect(subject.instruct_plane_land(plane)).to eq [plane]
  end

  it 'instructs plane to take off and confirms plane has left airport' do
    plane = Plane.new
    subject.instruct_plane_land(plane)
    expect(subject.instruct_plane_take_off(plane)).to eq "#{plane} has left airport"
  end

end
