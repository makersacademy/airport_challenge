require "./lib/airport.rb"
require "./lib/airplane.rb"

describe Airport do
  
  describe '#land' do
    it 'responds to the instruction to land a plane' do
      expect(subject).to respond_to :land
    end
  end

end