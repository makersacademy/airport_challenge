require 'weather'

describe Weather do
  it 'Checks if the weather is stormy' do
    allow(subject).to receive(:stormy?) { true }
  end

end
