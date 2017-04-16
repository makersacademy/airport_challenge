require 'plane'

describe Plane do
  it 'plane has landed' do
    plane = Plane.new
    expect(subject.land(plane)).to equal plane
  end

  it { is_expected.to respond_to :landed? }

end
