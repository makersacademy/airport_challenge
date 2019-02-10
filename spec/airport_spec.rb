require 'airport'

describe Airport do

  it ' instructs a plane to land' do
    plane = Plane.new
    expect(subject.instruct_to_land(plane)).to eq [plane]
  end


end
