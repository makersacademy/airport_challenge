require 'plane'

describe Plane do
  it 'has a public attribute of "flying"' do
    expect(subject).to respond_to :flying
  end
  it 'starts off on the ground' do
    expect(subject.flying).to eq false
  end
  it 'flying attribute can be set' do
    subject.flying = true
    expect(subject.flying).to eq true
  end
end
