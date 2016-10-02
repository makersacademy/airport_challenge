require 'weather'

describe Weather do
  subject(:weather) {described_class.new}

  it {is_expected.to respond_to(:stormy?)}

  it 'tells us that the weather is stormy' do
    allow(weather).to receive(:stormy) {true}
  end

  it 'tells us that the weather is fine' do
    allow(weather).to receive (:stormy) {false}
  end

end
#
