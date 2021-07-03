require 'plane'

describe Plane do
  it 'responds to land' do
    expect(subject).to respond_to(:land)
  end

  it 'responds to take off' do
    expect(subject).to respond_to(:take_off)
  end
  
  it 'confirms the plane has left the airport if it has taken off' do
    subject.take_off
    expect(subject.left_airport?).to eq true
  end
end
