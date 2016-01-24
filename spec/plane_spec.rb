require 'plane'

describe Plane do

  it 'can receive the land command with 1 argument' do
    expect(subject).to respond_to(:land).with(1).argument
  end

end
