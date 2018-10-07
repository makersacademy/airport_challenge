require 'weather'

describe Weather do
  it 'can be sunny' do
    allow(subject).to receive(:seed) { 0.9 }
    expect(subject.check).to eq "sunny"
  end

  it 'can be stormy' do
    allow(subject).to receive(:seed) { 0.1 }
    expect(subject.check).to eq "stormy"
  end

  it 'weather seed is randomly generated' do
    rand_number = Array.new
    srand(1)
    5.times do
      rand_number << subject.seed
    end
    expect(rand_number).to eq [0.417022004702574, 0.7203244934421581, 0.00011437481734488664, 0.30233257263183977, 0.14675589081711304]
  end

  it 'weather is randomly generated' do
    weather = Array.new
    srand(1)
    5.times do
      weather << subject.check
    end
    expect(weather).to eq ["sunny", "sunny", "stormy", "sunny", "stormy"]
  end
end
