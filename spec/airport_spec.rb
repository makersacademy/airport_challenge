require 'airport'

describe Airport do
  describe '#land' do
    it 'lands a plane' do
      airport = Airport.new
      expect(airport).to respond_to :land
    end
  end

  describe '#take_off' do
    it "let's a plane take off" do
      airport = Airport.new
      expect(airport).to respond_to :take_off
    end
  end

  it 'confirms take off' do
    airport = Airport.new
    expect(airport).to respond_to :confirm_take_off
  end

  it 'raises error when the airport is full' do
    airport = Airport.new
    expect(airport.land).to raise_error 'Airport is full'
  end
end