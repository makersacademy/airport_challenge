require 'airport'

describe Airport do

  it 'expects a new instance of the airport class' do
    expect(Airport.new.class).to eq Airport
  end

  it 'lands a plane' do
    plane = 'plane'
    expect(subject.land(plane)).to eq [plane]
  end

  it 'checks if a specific plane has landed' do
    plane = 'plane'
    subject.land(plane)
    expect(subject.landed?(plane)).to eq true
  end

end
