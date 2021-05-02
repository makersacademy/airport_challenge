require "./lib/airport.rb"
require "./lib/airplane.rb"

describe Airport do
  
  describe '#land' do
    it 'should instruct a plane to land in an Airport' do
      airplane = Airplane.new
      expect(subject.land(airplane)).to eq(airplane)
    end
  end

end