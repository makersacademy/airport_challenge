require 'weather'

describe Weather do
  it 'can randomly generate stormy weather' do
    expect(subject).to respond_to(:stormy?)
  end

  it 'returns true or false' do
    expect(subject.stormy).to be(true).or be(false)
  end
end
