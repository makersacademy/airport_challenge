require 'airport'



describe Airport do

  # has landing argument
  it { is_expected.to respond_to(:land).with(1).argument }

  #has a capacity
  it 'has a capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe 'take off' do
    #sets up test object
    let(:plane){ Plane.new }
    #can release a plane from capacity
    it 'releases a plane' do
      subject.land plane
      subject.taking_off
      expect(subject.empty?).to eq true
    end
    #can tell it to take off and have it be airbourne
    it 'instructs a plane to take off' do
      subject.land plane
      subject.taking_off
      expect(plane).to be_airbourne
    end
    # does not attempt to release a non-existent plane
    it 'raises an error message when the airport is empty' do
      expect { subject.taking_off }.to raise_error 'No planes here!'
    end
  end
end
