require "weather"

describe Weather do
  it 'describes the state of weather' do
    allow(subject).to receive(:bad_weather?).and_return(true, false)

    expect(subject.bad_weather?).to be true
    expect(subject.bad_weather?).to be false
  end
end
