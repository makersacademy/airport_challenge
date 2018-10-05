require 'plane'

describe Plane do
  it { is_expected.to respond_to :location? }
  it 'returns the current location' do
    plane = Plane.new
    subject.location?
    expect(subject.location?).to eq "air"
  end
end
