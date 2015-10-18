require 'plane'

describe Plane do
  it 'changes its status to true after landing' do
    subject.land
    expect(subject.landed?).to eq true
  end

  it 'changes its status to true after taking off' do
    subject.take_off
    expect(subject.taken_off?).to eq true
  end
end
