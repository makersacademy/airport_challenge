require 'weather'

RSpec.describe Weather do

    it 'is clear or stormy' do 
      day = subject

      expect(day.ok?).to eq('clear') || ('stormy')
    end
end