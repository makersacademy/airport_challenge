require_relative '../lib/plane'

describe Plane do

  it { is_expected.to respond_to(:land) }

  it { is_expected.to respond_to(:takeoff) }

  it 'cannot takeoff if already in the air' do
    subject.takeoff
    expect(subject.takeoff).to eq false
  end

  it 'remembers when it takes off' do
    subject.takeoff
    expect(subject.landed?).to eq false
  end

  it 'should start on the ground' do
    expect(subject.landed).to eq true
  end

  it 'can be set to both in the air and landed' do
    subject.takeoff
    expect(subject.landed?).to eq false
    subject.land
    expect(subject.landed?).to eq true
  end

end
