require 'weather'

describe Weather do
  it 'is sunny 4/5 times' do
    allow(subject).to receive(:random) { 3 }

    expect(subject.generate_weather).to eq "sunny"
  end

  it 'is stormy 1/5 times' do
    allow(subject).to receive(:random) { 4 }

    expect(subject.generate_weather).to eq "stormy"
  end
end
