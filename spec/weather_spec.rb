require 'weather'

describe Weather do
    it 'checks the weather' do
      expect(subject).to respond_to(:forecast)
    end
end