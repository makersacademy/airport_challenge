require 'weather'

describe Weather do
  subject(:Weather) {described_class.new}

  it 'should return true when subject.sunny? < 900' do
    allow(subject).to receive(:rand).and_return(500)
    expect(subject.sunny?).to eq true
  end

  it 'should return false when subject.sunny? > 900' do
    allow(subject).to receive(:rand).and_return(950)
    expect(subject.sunny?).to eq false
  end

end
