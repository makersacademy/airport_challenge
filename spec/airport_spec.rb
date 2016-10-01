require 'airport'

describe Airport do
    it { is_expected.to respond_to :full? }

airport = Airport.new

  it 'doesn\'t let a plane land when full' do
    expect(airport.full?).to eq true
  end
end
