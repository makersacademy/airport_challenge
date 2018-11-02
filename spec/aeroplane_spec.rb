require 'aeroplane'

describe Aeroplane do
  
  it 'can tell it is in the air' do
    expect(subject.status).to eq 'flying'
  end


end
