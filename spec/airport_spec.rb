require 'airport'

describe Airport do
  it 'responds to land' do
    expect(subject).to respond_to :land
  end
end
