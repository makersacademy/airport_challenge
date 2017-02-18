require 'plane'

describe Plane do

  it {is_expected.to respond_to :land_at}

  it 'lands the plane' do
    airport = Airport.new
    expect(subject.land_at(airport)).to eq "The plane has landed at #{airport}."
  end

end
