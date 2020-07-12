require 'plane'

describe Plane do
  it { is_expected.to respond_to(:arrive) }
  it 'changes state after landing' do
    expect(subject.arrive).to eq false
  end
  it 'initializes with a default state of flying' do
    expect(subject.flying).to eq true
  end
  it { is_expected.to respond_to(:depart) }
  it 'changes state after departing' do
    expect(subject.depart).to eq true
  end
end
