require 'weather'

describe Weather do
  it 'outputs either of 2 weather conditions: calm or stormy' do
    expect(subject.condition).to eq('calm').or(eq('stormy'))
  end
end
