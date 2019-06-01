require 'airport'

RSpec.describe Airport do

  it ' instruct an airplane to land at the airport ' do
    airplane = Airplane.new
    expect(subject.land(airplane)).to eq(airplane)
  end

  describe '#take_off' do
    airplane = Airplane.new
    it ' raise an error if the weather is stormy ' do
      airport = Airport.new
      airport.weather = :stormy
      expect { airport.take_off(airplane) }.to raise_error 'The weather is stormy'
    end 

    it ' instruct a plane to take off ' do 
      airport = Airport.new
      airport.weather = :sunny
      expect(airport.take_off(airplane)).to eq "The airplane #{airplane} has taken off"
    end
  end

end
