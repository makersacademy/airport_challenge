require 'control_tower'

describe ControlTower do
  it 'has a forecast' do
    expect(subject).to respond_to :forecast
  end
  it 'returns the weather condition as a symbol' do
    expect(subject.forecast).to be_a Symbol
  end
  it 'returns the symbol sunny or stormy' do
    expect(subject.forecast).to eq(:sunny || :stormy)
  end
end
