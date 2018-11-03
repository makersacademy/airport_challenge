require "weather"

describe Weather do

  it "randomizer checker - gives 1 and returns 'Stormy'" do
    allow(subject).to receive(:randomizer) { 1 }
    expect(subject.conditions).to eq "Stormy"
  end

  it "randomizer checked - gives 3 and returns 'Sunny'" do
    allow(subject).to receive(:randomizer) { 3 }
    expect(subject.conditions).to eq "Sunny"
  end

end
