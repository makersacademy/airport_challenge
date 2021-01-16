require 'weather'

describe Weather do
  it 'stormy returns true or false' do
    expect(subject.stormy?).to be(true).or be(false)
  end
end
