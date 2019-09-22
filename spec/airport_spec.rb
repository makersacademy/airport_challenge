require 'airport'

describe Airport do
  it 'responds to #prevent_take_off' do
    expect(subject).to respond_to :prevent_take_off
  end

  it 'responds to #prevent_land' do
    expect(subject).to respond_to :prevent_landing
  end

  it 'is full' do
    expect(subject.full?(11)).to eq true
  end

  it 'has a specific plane in the airport' do
    expect(subject.plane_in_airport?).to eq true
  end

end
