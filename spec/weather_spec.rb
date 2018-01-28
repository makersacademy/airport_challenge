require 'weather'

describe Weather do
  it 'has a weather attribute' do
    expect(subject.weather).to be_a Symbol
  end
end
