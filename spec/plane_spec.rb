require 'plane'

describe Plane do
  it 'is on ground when initialized' do
    expect(subject).not_to be_flying
  end
  it 'is #flying' do
    expect(subject.flying?).to eq false
  end
  it 'can land' do
    plane = subject.land
    expect(plane).to be_landed
  end
end
