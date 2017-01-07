require 'airport'

describe Airport do
  it 'should assign a default capacity when initialised' do
    expect(subject.capacity).not_to be_nil
  end
end
