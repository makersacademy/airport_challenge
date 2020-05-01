require 'weather'

describe Weather do
  it 'checks what the weather is doing' do
    allow(subject).to receive(:rand) { 1 }
    expect(subject.check).to eq(1)
  end

  it 'sees if the weather is stormy' do
    allow(subject).to receive(:check) { 1 }
    expect(subject).not_to be_stormy
  end
end
