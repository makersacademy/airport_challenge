require 'weather'

describe Weather do
  it 'returns boolean value when created' do
    expect(subject.stormy).to be(true).or be(false)
  end
end
