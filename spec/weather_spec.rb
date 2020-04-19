require 'weather'

describe Weather do
  it 'checks what the weather is doing' do
    weather = Weather.new
    allow(weather).to receive(:rand).and_return(1)
    expect(weather.check).to eq(1)
  end
end
