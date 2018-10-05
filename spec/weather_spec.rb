require 'weather'

describe Weather do
  it 'can be sunny' do
    expect(subject.check).to eq "sunny"
  end
end
