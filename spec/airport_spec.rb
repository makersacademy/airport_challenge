require 'airport'

describe Airport do
  it 'displays current weather conditions' do
    is_expected.to respond_to(:weather)
  end

  it 'is created with weather conditions' do
    expect(Airport.new.weather).not_to eq nil
  end
end