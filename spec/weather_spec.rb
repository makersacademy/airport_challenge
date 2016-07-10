require 'weather'

describe Weather do
  describe '#fair?' do
        it 'responds to the method with true or false' do
            expect(Weather.fair?).to satisfy {|value| (value == true) || (value == false) }
        end
    end
end
