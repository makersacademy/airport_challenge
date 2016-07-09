require 'airport'

describe Airport do
  describe '# confirm_landing' do
    it {is_expected.to respond_to(:confirm_landing)}
  end

  it 'should be empty on initialization' do
    airport = Airport.new
    expect(airport.get_airplanes.length).to eq 0
  end
end
