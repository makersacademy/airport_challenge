require 'plane'

describe Plane do
  it 'allows plane to be flying' do
    expect(subject).to respond_to(:flying?)
  end

  it 'flying is true when plane flying' do
    expect(subject.ground?).to eq :grounded
  end

  it 'flying is false when plane grounded' do
    expect(subject.flying?).to eq :air
  end
end
