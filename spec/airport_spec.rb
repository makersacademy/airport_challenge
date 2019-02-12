require "airport"
require "plane"

describe Airport do
  let(:plane) {:plane}
  it 'should take a plane and add it to the hangar' do
    expect(subject.land_plane(plane)).to eq [plane]
  end

end
