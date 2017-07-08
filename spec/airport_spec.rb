require 'airport'

describe Airport do
  subject(:airport) {described_class.new}
  it {is_expected.to respond_to(:land)}
  it 'has a plane when landed' do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane).to eq plane
  end
end
