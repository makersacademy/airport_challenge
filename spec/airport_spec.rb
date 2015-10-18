require 'airport'

describe Airport do

  let(:plane) { double('plane')}

  it 'lands a plane on command' do
    subject.land(plane)
    expect(subject.plane).to eq plane
  end

  it 'takes-off a plane on command' do
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.plane).to eq nil
  end

  it 'refuses to land a plane if full (capacity of one)' do
    subject.land(plane)
    expect { subject.land(plane) }.to raise_error 'Airport full.'
  end


end
