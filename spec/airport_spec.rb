require 'airport'

describe Airport do
  let(:plane){double :plane, landed?: true}

  it {is_expected.to respond_to :land_plane}
  it {is_expected.to respond_to :take_off}

  it "lands a plane" do
    subject.land_plane(plane)
    expect(subject.planes).to include plane
  end

end
