require 'plane'

describe Plane do
  plane = Plane.new
  it 'checks whether the plane tookoff' do
    expect(subject.departed).to eq true 
  end
end

# describe Plane do
#   # airport = Airport.new
#   # subject.land(airport)
#   it { is_expected.to respond_to :land } 
#   it { is_expected.to respond_to :take_off } 

# end