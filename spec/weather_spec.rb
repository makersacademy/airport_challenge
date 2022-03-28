require 'weather'
require 'airport'

describe Weather do
  
  it 'returns a random boolean' do
    expect(subject.stormy?).to eq(true).or(eq(false))
  end
end
