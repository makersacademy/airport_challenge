require 'weather'

describe Weather do
  it 'can be stormy' do
  expect(subject.stormy?).to be(true).or be(false)
  end
end
