require 'airport.rb'

describe Airport do
  let(:plane) {Plane.new}

  it { is_expected.to respond_to :is_empty }

  describe 'Landing' do
    it { is_expected.to respond_to :land }

    it 'Confirm airport is full if plane has landed' do
      subject.land(plane)
      expect(subject.is_empty).to eq false
    end
  end

  describe 'Takeoff' do
    it { is_expected.to respond_to :takeoff }

    it 'Confirm plane that took off is no longer in the airport' do
      subject.takeoff(plane)
      expect(subject.is_empty).to eq true
    end
  end
    
end