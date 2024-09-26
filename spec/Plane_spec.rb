require 'Plane'

describe Plane do

  it 'boarding passengers' do
    expect(subject.boarding).to eq('Passengers boarding complete!')
  end

  it 'disembark passengers' do
    expect(subject.disembark).to eq('Passengers disembark complete!')
  end
end
