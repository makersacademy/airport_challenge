require 'airport'

describe Airport do
  it 'displays current weather conditions' do
    is_expected.to respond_to(:weather)
  end
end