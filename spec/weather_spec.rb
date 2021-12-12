require 'weather' 

describe Weather do
  subject(:weather) { described_class.new }

  it 'returns true if rand returns 1' do
    allow(weather).to receive(:random).and_return(1)
    expect(weather.check).to eq true
  end

  it 'returns false if random does not returns' do
    allow(weather).to receive(:random).and_return(3)
    expect(weather.check).to eq false
  end
end
