require 'airport.rb'

describe Airport do
  let(:plane) {Plane.new}

  it { is_expected.to respond_to :empty? }

  describe 'Landing' do
    it { is_expected.to respond_to :land }
  end

  describe 'Takeoff' do
    it { is_expected.to respond_to :takeoff }

    it 'Confirm plane that took off is no longer in the airport' do
      subject.takeoff(plane)
      expect(subject.empty?).to eq true
    end
  end
    
end