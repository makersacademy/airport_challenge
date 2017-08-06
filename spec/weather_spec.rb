require_relative '../lib/weather'

describe Weather do

  it 'can set a state' do
    subject.state'sunny'
    expect(subject.now).to eq 'sunny'
  end

  it 'can check current weather' do
    subject.state 'sunny'
    expect(subject.now).to eq 'sunny'
    subject.state 'stormy'
    expect(subject.now).to eq 'stormy'
  end

end
