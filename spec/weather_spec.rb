=begin
require 'weather'

describe Weather do
  context 'when stormy' do
    it 'checks if weather is stormy' do
      allow(weather).to recieve(:stormy?).and_return(true)
    end
  end
=end
