require 'plane'

describe Plane do
  it 'responds to land command with 1 argument (i.e. the destination airport)' do
  expect(subject).to respond_to(:land).with(1).argument
  end

end