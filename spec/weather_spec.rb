require 'weather'

describe Weather do
  it 'is either clear or stormy' do
    expect(subject.condition).to eq('stormy').or eq('clear')
  end
end
