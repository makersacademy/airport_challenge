require 'airport'

describe Airport do
  it 'can create instances of Airport' do
    expect(Airport.new("Heathrow")).to be_a_kind_of(Airport)
  end

  it 'keeps a log of planes currently grounded' do
    heathrow = Airport.new("Heathrow")
    plane = Plane.new
    plane.take_off
    plane.land(heathrow)
    expect(heathrow).to have_attributes(:log => [plane])
  end
end
