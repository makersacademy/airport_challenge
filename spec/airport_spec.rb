require "airport"

describe Airport do
  it 'accepts airplanes to land' do
    plane = Plane.new
    expect(subject.accepts_landing(plane)).to eq "Plane landed"
  end
end
