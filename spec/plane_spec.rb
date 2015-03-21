require 'plane'

describe Plane do

  it 'has a flying status when created' do
    expect(subject.status).to eq 'flying'
  end

  it 'can be asked to take off' do
    expect(subject).to respond_to :take_off
  end

  it 'when told its touched down will change its status' do
    subject.touch_down
    expect(subject.status).to eq 'landed'
  end

  it 'when told to take off will change status' do
    subject.touch_down
    subject.take_off
    expect(subject.status).to eq 'flying'
  end
end
