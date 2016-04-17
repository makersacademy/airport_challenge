require 'weather'

describe Weather do 

  it 'can be sunny' do
    allow(subject).to receive(:number).and_return 1
    expect(subject.stormy?).to be false
    expect(subject.sunny?).to be true
  end

  it 'can be stormy' do
    allow(subject).to receive(:number).and_return 5
    expect(subject.stormy?).to be true
    expect(subject.sunny?).to be false
  end
end