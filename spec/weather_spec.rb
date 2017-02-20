require 'weather'

describe 'Weather' do

  it 'tests the stormy? method' do
    allow(subject).to receive(:stormy?).and_return true
    expect(subject.stormy?).to be true
  end
end
