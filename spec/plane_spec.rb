require 'plane'

describe Plane do

  it 'has a flying status when created' do
    expect(subject.status).to eq 'flying'
  end

  it 'has a landed status when landed' do
    subject.land
    expect(subject.status).to eq 'landed'
  end

  it 'can take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'changes its status to flying after taking off' do
    subject.take_off
    expect(subject.status).to eq 'flying'
  end
end
