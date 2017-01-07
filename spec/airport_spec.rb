require 'airport'

describe Airport do
  it 'Can hold planes' do
    expect(subject).to respond_to :planes
  end
end
