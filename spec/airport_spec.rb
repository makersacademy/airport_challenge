require 'airport'
describe Airport do
  it 'has method land and takes on argument' do
    is_expected.to respond_to(:land)
  end
end
