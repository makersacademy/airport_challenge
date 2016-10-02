require './lib/weather'

describe Weather do

  it 'returns the current weather' do
    allow(subject).to receive(:sunny?).and_return(true,false)
    expect(subject.sunny?).to eq true
    expect(subject.sunny?).to eq false
  end

end
