require 'airport.rb'

describe Airport do
  it 'should create an aiport object'
  describe '#land' do
    it 'land the plane at the airport' do
      expected(subject.land).to eq("Plane has landed safely!")
    end
  end
end
