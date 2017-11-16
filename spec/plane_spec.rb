require 'plane'

describe Plane do
  it 'is landed when initialized' do
    expect(subject).to be_flying
  end
  it 'is #flying' do
    expect(subject.flying?).to eq true
  end
end