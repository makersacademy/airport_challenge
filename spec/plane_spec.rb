require 'plane'

describe Plane do

  it 'should respond to a method called landed?' do
    expect(subject).to respond_to (:landed?)
  end

  it 'should respond to a method called taken_off?' do
    expect(subject).to respond_to (:taken_off?)
  end
  
end
