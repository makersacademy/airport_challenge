require 'plane'

describe Plane do

let(:airport) {double(:airport)}

  it{is_expected.to respond_to(:landed?)}

  it 'can tell if a plane has landed' do
    subject.location = airport
    expect(subject.landed?).to eq(true)
  end

  it 'can tell if a plane is in the air' do
    subject.location = "in_the_air"
    expect(subject.landed?).to eq(false)
  end

end
