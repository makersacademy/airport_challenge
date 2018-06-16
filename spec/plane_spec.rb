require 'plane'

describe Plane do
  it 'Has a land function' do
    expect(subject).to respond_to(:land)
  end
  it 'Reports if the plane has landed succesfully' do
    airport = Airport.new
    expect { subject.land(airport) }.to output("Plane landed safely at #{airport}.\n").to_stdout
  end
  it 'Has a take-off function' do
    expect(subject).to respond_to(:take_off)
  end
  it 'Reports if plane has taken off successfully' do
    expect { subject.take_off }.to output("Plane took off successfully.\n").to_stdout
  end
end
