require 'plane'

describe Plane do

  it 'has a flying status when created' do
    expect(subject.status).to eq 'flying'
  end

  it 'changes its status to landed after landing' do
    expect(subject.land).to eq 'landed'
  end

  it 'changes its status to flying after taking off' do
    expect(subject.takeoff).to eq 'flying'
  end

end
