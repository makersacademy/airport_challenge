require 'airport'

RSpec.describe Airport do 

  it ' instruct an airplane to land at the airport ' do
    airplane = Airplane.new
    expect(subject.land(airplane)).to eq(airplane)
  end

  it ' instruct a plane to take off ' do 
    airplane = Airplane.new
    expect(subject.take_off(airplane)).to eq "The airplane #{airplane} has taken off"
  end

end
