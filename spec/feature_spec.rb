describe 'Feature Test' do
  let(:heathrow) { Airport.new }
  let(:ibiza) { Airport.new }
  let(:new_york) { Airport.new }

  let(:eoins_private_jet) { Plane.new }
  let(:ryanair) { Plane.new }
  let(:boeing747) { Plane.new }

  let(:weather) { double("weather") }

  it 'Eoin lands in Ibiza' do
    expect(eoins_private_jet.land(ibiza)).to eq 1
  end

  it 'Ryanair lands in Heathrow' do
    expect(ryanair.land(heathrow)).to eq 1
  end

  it 'Eoin tries to land in New York, but is already in Ibiza' do
    eoins_private_jet.land(ibiza)
    expect { eoins_private_jet.land(new_york) }.to raise_error "plane already landed"
  end

  it 'Boeing 747 tries to take off from Heathrow but is already flying' do
    expect { boeing747.take_off(heathrow) }.to raise_error "plane already flying"
  end

  it 'Boing 747 Lands in New York' do
    expect(boeing747.land(new_york)).to eq 1
  end

  it 'Eoin takes off from Ibiza' do
    eoins_private_jet.land(ibiza)
    expect(eoins_private_jet.take_off(ibiza)).to eq 0
  end

end
