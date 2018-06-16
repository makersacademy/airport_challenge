require './lib/airport'

describe Airport do

  it { is_expected.to respond_to :land }

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end
end
