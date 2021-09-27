require "airport"

describe Airport do 
  it 'airport response to land' do
    expect(subject).to respond_to :land
  end  

  it "should land when given a plane" do
    plane = Plane.new
    subject.land(plane)
    expect(subject.plane_array).to eq([plane])
  end

  it 'responds to the takeoff method' do
    expect(subject).to respond_to(:takeoff)
  end

  it 'takeoff should lift off a plane' do
    plane = Plane.new
    expect(subject.takeoff(plane)).to eq(plane)
  end

end
