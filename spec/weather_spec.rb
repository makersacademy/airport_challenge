require 'weather'

describe Weather do
  describe '#is_fair' do
        it 'responds to the method' do
            expect(Weather.fair?).to eq true
        end
    end
end
