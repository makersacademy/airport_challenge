require 'airport'

describe Airport do
  it { is_expected.to respond_to :weather}
  it { is_expected.to respond_to :capacity}
  it { is_expected.to respond_to :planes}
  it { is_expected.to respond_to :land}
  it { is_expected.to respond_to :takeoff}

  describe '#weather' do
    it 'generates the current weather when a plane is attempting to take off or land' do

    end
  end

  describe '#capacity' do
    it 'prevents landing when the airport capacity is full' do

    end

    it 'allows for capacity to be changed when creating a new airport' do

    end
  end

  describe '#planes' do
    it 'returns what planes are currently at the airport' do

    end
  end
  describe '#land' do
    it 'allows planes to land' do

    end

    it 'raises an error when a plane tried to land and the weather is stormy' do

    end
  end

  describe '#takeoff' do
    it 'allows planes to takeoff' do

    end

    it 'raises an error when a plane tries to takeoff and the weather is stormy' do

    end
  end
end
