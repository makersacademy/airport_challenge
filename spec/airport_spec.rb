require 'airport'
describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:takeoff).with(1).argument }
  it { is_expected.to respond_to(:weatherquality) }
  it { is_expected.to respond_to(:terminal) }

  describe '#land' do
    it 'should not let a plane land if weather is bad' do
      plane = Plane.new
      expect {(subject.land(plane)).weatherquality}.to raise_error ('Weather is bad for landing') if subject.weatherquality == 'bad'
    end

    it 'should let a plane land' do
      plane = Plane.new
      expect(subject.land(plane)).to eq plane
    end
  end

  describe '#takeoff' do
    it 'should let a plane take off' do
      plane = subject.land(Plane.new)
      expect(subject.takeoff(plane)).to eq plane
    end
    it 'should not let a plane take off if weather is bad' do
      plane = Plane.new
      expect {(subject.takeoff(plane)).weatherquality}.to raise_error ('Weather is bad for taking off') if subject.weatherquality == 'bad'
    end
  end

  it 'should tell us the weather' do
    subject.weatherquality
    expect(['bad','good']).to include(subject.weatherquality)
  end

end









# require 'airport'
# describe Airport do
#
#   it { is_expected.to respond_to(:land).with(1).arguments }
#   it { is_expected.to respond_to(:takeoff) }
#
#   describe '#land' do
#     it 'raises an error if the capacity is full' do
#       plane = Plane.new
#       expect {subject.land(plane)}.to raise_error('Capacity has been reached')
#     end
#     it 'a plane should land' do
#       plane = Plane.new
#       expect(subject.land(plane)).to eq plane
#     end
#   end
#
#   describe '#takeoff' do
#     it 'raises an error if the weather is bad to take-off' do
#       expect {subject.takeoff}.to raise_error('The weather is too bad to take-off')
#     end
#     it 'a plane should takeoff' do
#       plane = Plane.new
#       expect(subject.takeoff).to eq plane
#     end
#   end
# end
#
# thethey def dif
# the end
