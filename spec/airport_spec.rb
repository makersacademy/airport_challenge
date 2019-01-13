require 'airport'

RSpec.describe Airport do
  it 'instructs a plane to land' do
    is_expected.to respond_to(:land).with(1).argument
  end

  it 'instructs a plane to take off' do
    is_expected.to respond_to(:take_off)
  end
end
