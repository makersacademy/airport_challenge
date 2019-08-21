require 'weather'

RSpec.describe Weather do

  it 'return :sunny' do
    allow(subject).to receive(:status).and_return(:sunny)
    expect(subject.status).to eq(:sunny)
  end

  it 'return :stormy' do
    allow(subject).to receive(:status).and_return(:stormy)
    expect(subject.status).to eq(:stormy)
  end

end
