require 'airport'

describe Airport do
  it 'instructs plane to land' do
    plane = Plane.new
    expect(subject.plane_land(plane)).to eq(true) 
  end 

  # it 'raises an error when plane does not land' do
  #   expect(subject.plane_land).to raise_error(ArgumentError)
  # end 
  
  it 'confirms that a plane is no longer in airport once it has taken off' do
    expect(subject.plane_take_off).to eq(true)
  end 

  it 'raises an error when airport is full' do 
    2.times { subject.plane_land Plane.new }
    expect { subject.plane_land Plane.new }.to raise_error 'Airport is full'
  end 

  it 'default airport capacity is set' do
  end 

  it 'default airport capacity can be overridden' do 
  end

end