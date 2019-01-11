require 'sky'

describe Sky do

  let(:plane) { double :plane }

  it "allows us to add a plane to the sky" do
    subject.add_plane(plane)
    expect(subject.flying_planes).to eq [plane]
  end


end
