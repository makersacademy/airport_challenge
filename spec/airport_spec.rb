require 'airport'
require 'plane'

describe Airport do 
  it { is_expected.to respond_to(:land).with(1).argument }

  it 'expects a plane to land at an aiport' do
    plane = Plane.new
    expect(subject.land(plane)).to eq([plane])
  end 
  
  it 'should not accept more than 10 planes to land at a time' do 
    10.times {subject.land(Plane.new)}
    plane = Plane.new
    expect{subject.land(plane)}.to raise_error 'Not accepting more planes to land'
  end

  it 'expects instances of Airport class to respond to the take_off method' do 
    plane = Plane.new
    expect(Airport.new).to respond_to(:take_off)
  end 
end