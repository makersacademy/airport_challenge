require 'plane'

describe Plane do

  it 'is a plane' do
    plane = subject
    expect(subject).to eq plane
  end

  it 'has a status, which will be set to "flying" by default' do
    expect(subject.status).to eq 'flying'
  end



end
