require 'plane'

describe Plane do

   

  it { is_expected.to respond_to(:flying?) }

  it { is_expected.to respond_to(:landed?) }

  subject(:plane) { described_class.new }

  let(:airport) { double(:airport, land: nil) }



describe 'landed?' do 
  it 'has landed at the airport' do
    plane.land
    expect(plane.landed?).to eq true
    expect(plane.flying?).to eq false
  end
end
  
  describe '#land' do
    it "has landed at the airport" do
    plane.land
    expect(plane.flying?).to eq false
    expect(plane.landed?).to eq true
    end
  end

  describe '#take_off' do
    it "has taken_off from the airport" do  
      plane.land
      plane.take_off
      expect(plane.flying?).to eq true
      expect(plane.landed?).to eq false
      end
    end
end