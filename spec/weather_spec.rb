require 'weather'

describe Weather do
  
  it 'can be sunny' do
    expect(subject).to respond_to(:stormy)
  end
end
