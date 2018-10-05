require 'weather'

describe Weather do
  it 'can be sunny' do
    allow(subject).to receive(:seed) { 1 }
    expect(subject.check).to eq ("sunny")
  end

  it 'can be stormy' do
    allow(subject).to receive(:seed) { 0 }
    expect(subject.check).to eq "stormy"
  end

  it 'weather seed is randomly generated' do
    srand(1)
    expect(subject.seed).to eq 0.417022004702574
    expect(subject.seed).to eq 0.7203244934421581
    expect(subject.seed).to eq 0.00011437481734488664
    expect(subject.seed).to eq 0.30233257263183977
    expect(subject.seed).to eq 0.14675589081711304
  end

  it 'weather is randomly generated' do
    srand(1)
    expect(subject.check).to eq "sunny"
    expect(subject.check).to eq "sunny"
    expect(subject.check).to eq "stormy"
    expect(subject.check).to eq "sunny"
    expect(subject.check).to eq "stormy" 
  end

end
