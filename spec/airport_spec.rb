require 'airport.rb'

describe Airport do
  let(:plane) {Plane.new}

  it { is_expected.to respond_to :is_empty }

  describe 'Landing' do
    it { is_expected.to respond_to :land }

    it 'Confirm airport is full if plane has landed' do
      subject.land(plane)
      expect(subject.is_empty).to eq "Airport is at max capacity"
    end

    it 'Performs a safety check to prevent planes landing when airport is full' do
      subject.land(plane)
      expect(subject.safety_check).to eq "Capacity is full, do not land"
    end
  end

  describe 'Takeoff' do
    it { is_expected.to respond_to :takeoff }

    it 'Confirm plane that took off is no longer in the airport' do
      subject.takeoff(plane)
      expect(subject.is_empty).to eq "Space to land here"
    end

    it 'Performs a safety check to allow planes to land when there is space for them' do
      expect(subject.safety_check).to eq "Space available, please land here"
    end
  end
    
end