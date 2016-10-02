require 'plane'

describe Plane do
  it 'lands' do
    subject.land
    expect(subject.state).to eq 'grounded'
  end
  it 'takes off' do
    subject.take_off
    expect(subject.state).to eq 'flying'
  end
end
