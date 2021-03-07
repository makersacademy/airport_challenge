require 'weather'

describe Weather do
  it 'responds to a request to describe the weather' do
    expect(subject).to respond_to(:forecast)
  end
  it 'describes weather as sunny or stormy' do
    expect(subject.forecast).to eq("sunny").or(eq("stormy"))
  end
end
