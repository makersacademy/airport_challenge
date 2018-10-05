require 'weather'

describe Weather do
  it 'can be sunny' do
    expect(subject.check(1)).to eq "sunny"
  end

  it 'can be stormy' do
    expect(subject.check(0)).to eq "stormy"
  end
end
