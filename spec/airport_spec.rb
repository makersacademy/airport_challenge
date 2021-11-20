require 'airport'
require 'plane'

describe Airport do 
  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end 
end 