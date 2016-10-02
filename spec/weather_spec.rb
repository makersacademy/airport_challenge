require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it {is_expected.to respond_to(:stormy?)}

  it 'tells us the weather is stormy' do
    expect(weather).to be_stormy
  end

end
