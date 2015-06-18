require 'airport'

describe Airport do

  let(:plane) { double :plane, land: nil, take_off: nil }

  it { is_expected.to respond_to(:landing).with(1).argument }
  it { is_expected.to respond_to(:release).with(1).argument }

  before do
    allow(subject).to receive(:stormy?).and_return false
  end

  it 'has a DEFAULT capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'releasing a plane instructs it to take off' do
    # SETUP
    plane = double :plane, land: nil, take_off: nil
    subject.landing plane

    # EXPECTATION ABOUT THE FUTURE
    expect(plane).to receive :take_off

    # ACTION
    subject.release plane
  end


  # it 'instructs a plane to land' do
  #   expect(plane).to receive :land
  #   subject.land plane
  # end

  it 'instructs plane to land' do
    # Refactor to test that messages are sent out to other objects, not about what effect they have on that object
    # SETUP
    plane = double :plane, land: nil, take_off: nil

    # EXPECTATION ABOUT THE FUTURE
    expect(plane).to receive :land
    # ACTION
    subject.landing plane
   end

  # it 'receives a plane' do
  #   subject.landing plane
  #   # Try to write an expectation on the airport's collection of planes
  # end

  describe 'traffic control' do

    context 'when airport is full' do

      it 'does not allow plane to land' do
        subject.capacity.times { subject.landing plane }
        expect { subject.landing plane }.to raise_error 'The airport is full!'
      end

    end

    context 'when weather conditions are stormy' do
      it 'does not allow a plane to land' do
        plane = double :plane, land: nil, take_off: nil
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.landing plane }.to raise_error 'Too stormy to land.'
      end
      it 'does not allow a plane to take off' do
        plane = double :plane, land: nil, take_off: nil
        subject.landing plane
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.release plane }.to raise_error 'Too stormy to fly.'
      end
    end
  end
end
