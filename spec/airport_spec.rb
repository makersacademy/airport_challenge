require 'airport.rb'

describe Airport do
  let(:plane) { double(:plane) } # same as plane = double("plane")

  describe 'allows plane to land' do
    it 'lands plane' do
      subject.allow_landing(:plane)
      expect(subject.planes_now.length).to be 1
    end
  end
end
