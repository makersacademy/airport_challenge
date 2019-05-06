require 'airport'

describe Airport do
  it 'creates new airport object' do
    expect(Airport.new.is_a? Airport).to eq true
  end

  it { is_expected.to respond_to :land }

  it 'instructs an instance of plane to land and returns a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq plane
  end

end
