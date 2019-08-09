require 'weather'

describe Weather do
  it 'can randomly generate stormy weather' do
    expect(subject).to respond_to(:stormy?)
  end
end
