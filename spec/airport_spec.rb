require "airport"

describe Airport do 
  it 'airport response to land' do
    expect(subject).to respond_to :land
  end  

  it 'lands a plane' do
    plane = Plane.new
    expect(subject.land(plane)).to eq (plane)
  end

  it 'returns a plane ' do 
    plane = Plane.new
    subject.land(plane)
    expect(subject.land(plane).is_a? Plane).to eq true
  end

end
