require 'weather'

describe Weather do
  before(:each) do
    @weather = Weather.new
  end

  it 'checks what the weather is doing' do
    allow(@weather).to receive(:rand) { 1 }
    expect(@weather.check).to eq(1)
  end

  it 'sees if the weather is stormy' do
    allow(@weather).to receive(:check) { 1 }
    expect(@weather).not_to be_stormy
  end
end
