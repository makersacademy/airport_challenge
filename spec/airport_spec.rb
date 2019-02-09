require 'airport'

describe Airport do
  it 'is created and stores planes' do
    Airport.new
  end

  it 'responds to land command to let a plane land' do
  expect(subject).to respond_to :land
  end

end
