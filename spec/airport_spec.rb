require 'airport'

describe Airport do

  describe 'launch' do
    it 'launches a specific plane' do
      subject.instance_variable_set(:@weather, :stormy)
      expect(subject).to respond_to(:launch).with(1).argument
    end
  end

  describe 'launch' do
    it 'raises an error when you try to launch a plane that isn\'t there' do
      subject.instance_variable_set(:@weather, :stormy)
      subject.instance_variable_set(:@hanger, [:plane1rsr])
      expect { subject.launch(:plane2) }.to raise_error 'That plane isn\'t here'
    end
  end

  describe 'launch' do
  it 'raises a danger error when you try to launch a legit plane in a storm' do
    subject.instance_variable_set(:@weather, :stormy)
    subject.instance_variable_set(:@hanger, [:plane])
    expect { subject.launch(:plane) }.to raise_error 'It\'s too dangerous to launch!'
  end
end


  describe 'land' do
    it 'receives a plane' do
      subject.instance_variable_set(:@weather, :stormy)
      expect(subject).to respond_to(:launch).with(1).argument
    end
  end

  describe 'land' do
    it 'raises an error when you try to land a plane when there isn\'t room' do
      subject.instance_variable_set(:@weather, :sunny)
      Airport::DEFAULT_CAPACITY.times{subject.land(:plane)}
      expect { subject.land(:plane) }.to raise_error 'There\'s no room here'
    end
  end

  describe 'land' do
    it 'raises a specific error when you try to land a plane when there isn\'t room AND it\'s stormy' do
      subject.instance_variable_set(:@weather, :stormy)
      Airport::DEFAULT_CAPACITY.times{subject.land(:plane)}
      expect { subject.land(:plane) }.to raise_error 'There\'s no room here and it\'s too dangerous to land!'
    end
  end

  describe 'capacity' do
    it 'has a capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe 'space_check' do
    it 'can return its spare space, which is lowered by a plane landing' do
      subject.land(:plane)
      expect(subject.space_check). to eq (Airport::DEFAULT_CAPACITY-1)
    end
  end

  describe 'space_check' do
    it 'can return its spare space, which is raised by a plane launching' do
      subject.land(:plane1)
      subject.land(:plane2)
      subject.launch(:plane1)
      expect(subject.space_check). to eq (Airport::DEFAULT_CAPACITY-1)
    end
  end

  describe 'weather' do
    it 'has states of weather' do
      expect(subject).to respond_to(:weather)
    end
  end

end
