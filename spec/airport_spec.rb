require 'airport_challenge'

describe Airport do
  it 'lands a plane' do
    expect(subject.land(Plane.new)).to eq true
  end
end
