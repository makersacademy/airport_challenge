require 'weather'

describe Weather do
  it 'weather can be stormy' do
    subject.status = Weather::DEFAULT_WEATHER[0]
    expect(subject.status).to eq('stormy')
  end
  it 'weather can be sunny' do
    subject.status = Weather::DEFAULT_WEATHER[1]
    expect(subject.status).to eq('sunny')
  end
end
