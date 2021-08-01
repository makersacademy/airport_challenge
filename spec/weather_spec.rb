require 'weather'

describe Weather do
  
  it 'can be sunny' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'returns that it isnt stormy' do
    allow(subject).to receive(:stormy?) { false }
    expect(subject.stormy?).to eq(false)
  end

  it 'returns that it is stormy' do
    allow(subject).to receive(:stormy?) { true }
    expect(subject.stormy?).to eq(true)
  end
end
