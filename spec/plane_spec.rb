require 'plane.rb'

describe Plane do
  it 'plane is flying' do
    plane = Plane.new
    expect(plane).to respond_to :flying?
  end 
  
  it 'Plane lands' do
    plane = Plane.new
    expect(plane).to respond_to :land?
  end    

  it 'Plane Take off' do
    subject.take_off?
    expect(subject).to be_flying
  end
end
