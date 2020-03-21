require 'airport'

describe Airport do
  it 'tells you when it is full' do
    subject.full = true
    expect(subject.full?).to eq true
  end
end