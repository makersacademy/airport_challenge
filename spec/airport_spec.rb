require 'airport'

describe Airport do
  it 'instruct a plan to land' do
    expect(subject).to respond_to :land
  end
end


describe Airport do
  plane = Plane.new
  it 'can land a plane' do
    expect(subject).to respond_to(:store).with(1).argument
  end

  it 'stores something' do
    plane = Plane.new
    expect(subject.store(plane)).to eq plane
  end

  # describe '#lands_plane' do
  #   it 'allows to land planes' do
  #     plane = Plane.new
  #     subject.store(plane)
  #     expect(subject.land).to eq plane
  #   end
  # end

  it 'allows store planes' do
    plane = Plane.new
    subject.store(plane)
    expect(subject.plane).to eq plane
  end

end


  describe '#store' do

    it 'has a default capacity' do
      expect { subjecty.land }.to eq Airport::DEFAULT_CAPACITY
    end


    it 'shows when airport is full' do
      # 20.times { subject.store Plane.new }
      expect { subject.store Plane.new }.to raise_error 'Airport full'
    end
  end



describe Airport do
  it 'instruct a plan to take off' do
    expect(subject).to respond_to :take_off
  end

    it 'confirms no longer in the airport' do
      expect(subject.take_off).to eq "Plane has left the airport"
    end

end
