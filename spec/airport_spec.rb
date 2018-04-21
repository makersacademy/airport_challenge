require 'airport'

describe Airport do
  it 'responds to land method' do
    expect(subject).to respond_to(:land).with(1).arguments
  end
end
