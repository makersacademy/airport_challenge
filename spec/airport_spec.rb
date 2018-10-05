require 'airport'

describe Airport do

  it 'instructs a plane to land' do
#    airport = Airport.new
    expect(subject.land).to eq "Please land your plane."
  end

end
