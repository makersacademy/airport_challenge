require 'weather'

describe Weather do

  it 'is stormy' do
    # subject.stub(:chance) { 0 }
    allow(subject).to receive(:chance) { 0 }
    expect(subject.check_weather).to eq "stormy"
  end

  it 'is sunny' do
    allow(subject).to receive(:chance) { 1 }
    expect(subject.check_weather).to eq "sunny"
  end

  it 'forecasts by chance' do
    allow(subject).to receive(:chance) { 2 }
    expect(subject.chance).to eq 2
  end

end
