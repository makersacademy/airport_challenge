require 'airport'

describe Airport do
  it 'creates new airport object' do
    expect(Airport.new.is_a? Airport).to eq true
  end

  it { is_expected.to respond_to :land }

  it 'instructs an instance of plane to land and returns a list of planes' do
    plane1 = Plane.new
    plane2 = Plane.new
    subject.land(plane1)
    expect(subject.land(plane2)).to eq [plane1, plane2]
  end

end
