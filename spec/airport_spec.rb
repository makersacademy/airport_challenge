# tests I want for US 1 and US 2
# DONE
# successful instantiate airport
# successful airport.is_empty == true
# successful instantiate plane
# successful plane.is_in_airport == false

#TODO
# successful plane.land
# plane.land == plane_is_in_airport && airport_is_not_empty

# successful instantiate airport
require 'airport'
require 'plane'

describe Airport do
  it 'successfully instantiates' do
    expect(subject).to be_instance_of(Airport)
  end
  # successful airport.is_empty == true
  it 'starts empty' do
    expect(subject).to be_empty
  end

end
