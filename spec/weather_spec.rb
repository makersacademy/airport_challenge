require 'weather'

describe Weather do

  # subject (:plane) { described_class.new }
  # subject (:airport) { described_class.new }

  describe '#stormy?' do

    it 'weather is occasionally stormy' do
      count = 0
      1000.times do
        subject = Weather.new
        count += 1 if subject.stormy?
      end
      expect(count > 400).to eq false
    end

  end

end
