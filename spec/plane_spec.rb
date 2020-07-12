require 'plane'

describe Plane do
  it { is_expected.to respond_to(:land) }
  it 'changes state after landing' do
    expect(subject.land).to eq false
  end
  it 'initializes with a default state of flying' do
    expect(subject.flying).to eq true

  end
end
