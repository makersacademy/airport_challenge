require 'airport'

describe Airport do
  it 'should assign a default capacity when initialised' do
    expect(subject.capacity).not_to be_nil
  end

  it 'should have a default capacity of 1' do
    expect(subject.capacity).to eq 1
  end
end
