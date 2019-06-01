require 'airport'

describe Airport do

  it { is_expected.to respond_to(:safe?) }

  context "weather is sunny" do
    airport = Airport.new
    before { allow(airport).to receive(:weather).and_return('sunny') }
    
    it 'should be safe to land / takeoff if weather is sunny' do
      airport.set_safety
      expect(airport).to be_safe
    end
  end

  context "weather is stormy" do
    airport = Airport.new
    before { allow(airport).to receive(:weather).and_return('stormy') }
    
    it 'should not be safe to land / takeoff if weather is stormy' do
      airport.set_safety
      expect(airport).not_to be_safe
    end
  end
end