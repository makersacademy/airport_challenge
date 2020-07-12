require 'Plane'

describe Plane do

  it 'boarding passengers into the Plane' do
    expect(subject.boarding).to eq('Passengers boarding complete!')
  end

  it 'disembark passengers to destination' do
    expect(subject.disembark).to eq('Passengers disembark complete!')
  end
end
