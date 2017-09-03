require 'airport'
describe Airport do
  it 'has method land and takes on argument' do
    is_expected.to respond_to(:land).with(1).argument
  end
  it 'has method takeoff' do
    is_expected.to respond_to(:takeoff)
  end
end
