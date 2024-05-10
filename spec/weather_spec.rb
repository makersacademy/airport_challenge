require 'weather'

describe Weather do
  it 'returns stormy weather when given 9' do
    allow(subject).to receive(:rand).and_return(9)
    expect(subject.weather_condition).to eq :stormy
  end

  it 'returns sunny weather when given 1' do
    allow(subject).to receive(:rand).and_return(1)
    expect(subject.weather_condition).to eq :sunny
  end
end
