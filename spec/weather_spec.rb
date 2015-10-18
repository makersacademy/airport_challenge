require 'weather'

describe Weather do
  it 'checks if the weather is stormy or not' do
    expect(subject.stormy?).to eq(true)
  end
end
