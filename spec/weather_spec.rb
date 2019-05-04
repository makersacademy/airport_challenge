require 'weather'

describe 'Weather' do
  it 'has a stormy? method' do
    expect(Weather).to respond_to(:stormy?)
  end

  it 'is stormy if number is 10' do
    allow_any_instance_of(Object).to receive(:rand).and_return(10)
    expect(Weather.stormy?).to eq(true)
  end

  it 'is not stormy if number is not 10' do
    allow_any_instance_of(Object).to receive(:rand).and_return(1)
    expect(Weather.stormy?).to eq(false)
  end
end
