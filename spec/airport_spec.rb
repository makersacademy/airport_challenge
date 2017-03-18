require 'airport'

describe Airport do

  it 'expects a new instance of the airport class' do
    expect(Airport.new.class).to eq Airport
  end

  it 'lands a plane' do
    plane = 'plane'
    expect(subject.land(plane)).to eq [plane]
  end

  # it 'checks a plane has landed'


end
