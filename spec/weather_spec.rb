require 'weather'

describe Weather do
  describe '#fair?' do
        it 'responds to the method' do
            expect(Weather.fair?).to satisfy {|value| (value == true) || (value == false) }
        end
    end
end
