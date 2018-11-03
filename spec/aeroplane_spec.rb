require 'aeroplane'

describe Aeroplane do

  it 'can tell it is in the air' do
    expect(subject.status).to eq 'flying'
  end

  it 'can tell it is at an airport' do
    subject.land
    expect(subject.status).to eq 'airport'
  end

end
