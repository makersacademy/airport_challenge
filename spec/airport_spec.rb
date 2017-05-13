require 'airport'

describe Airport do
  it 'responds to #land' do
    is_expected.to respond_to(:land)
  end
  it 'responds to #land with the arguement "plane"' do
    is_expected.to respond_to(:land).with(1).argument
  end
end
