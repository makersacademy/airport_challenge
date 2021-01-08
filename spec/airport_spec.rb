require 'airport'
require 'plane'

describe Airport do
  it { is_expected.to respond_to(:land) }

  # it 'instructs a plane to land at an airport' do
  #   expect(subject.land).to be_an_instance_of Plane
  # end
end
