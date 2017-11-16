require 'airport'
let(:flying_plane) { double :plane}

describe Airport do
  it 'can land a plane' do
    expect(flying_plane).to receive(:land)
    subject.land(flying_plane)
  end

  xit 'confirms the plane has landed' do
    plane = double :plane, land: "it doesn't matter what I put here"
    subject.land(plane)
    expect(subject.confirm(plane)).to eq true
  end

end
