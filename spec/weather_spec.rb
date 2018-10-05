require 'weather'

describe Weather do
  it 'can be sunny' do
    expect(subject.check(1)).to eq "sunny"
  end
end
