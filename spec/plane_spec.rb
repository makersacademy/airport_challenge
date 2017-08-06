require_relative '../lib/plane'

describe Plane do

  it 'responds to "land" method' do
    expect(subject).to respond_to(:land)
  end

  it 'cannot takeoff if already in the air' do
    subject.takeoff
    expect(subject.takeoff).to eq false
  end

  it 'remembers when it takes off' do
    subject.takeoff
    expect(subject.landed?).to eq false
  end

  it 'should start in the air' do
    expect(subject.landed).to eq false
  end

  it 'can be set to both in the air and landed' do
    subject.takeoff
    expect(subject.landed?).to eq false
    subject.land
    expect(subject.landed?).to eq true
  end

end
