require 'airport'

describe Airport do

  it { is_expected.to be_instance_of(Airport) }

  it 'can instruct a plane to land at the airport' do
    plane = Plane.new
    subject.land_plane(plane)
    expect(subject.planes).to eq(plane)
  end

end
