require 'weather'

describe Weather do
  it 'generates weather' do
    expect(subject.weather).to satisfy { |v| v == :sunny || v == :stormy }
  end
  it 'shows if weather is stormy' do
    allow(subject).to receive(:weather).and_return :stormy
    expect(subject).to be_stormy
  end
end