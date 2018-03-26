require_relative '../lib/plane.rb'

describe Plane do

  subject(:plane) {described_class.new}

  it { is_expected.to respond_to(:flight).with(1).argument }

  it 'should have untracked status when instantiated' do
    expect(subject.status).to eq :untracked
  end

  it '#flight method should return the state it was passed' do
    expect(subject.flight(:state)).to eq :state
  end

  it 'should be in the air when it has a taken off state' do
    subject.flight(:taken_off)
    expect(subject).to be_in_the_air
  end

  it 'should not be in the air when it has a status other than taken off' do
    expect(subject).not_to be_in_the_air
  end
  
end
