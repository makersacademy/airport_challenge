require 'airport'

describe Airport do

  let(:plane) { double :plane }
  let(:airport) {Airport.new}

  before(:each) do
    Airport.any_instance.stub(:weather_condition).and_return('sunny')
  end
  # can't make the new rspec syntax to work

  it 'instructs a plane to land' do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'receives a plane' do
    subject.land plane
    expect(subject.landing_strip.count).to eq(1)
  end

  it 'instructs a plane to take off' do
    expect(subject).to respond_to(:take_off)
  end

  it 'releases a plane' do
    subject.take_off
    expect(subject.landing_strip.count).to eq(0)
  end

  context 'when airport is full' do
    it 'does not allow a plane to land' do
      subject.capacity.times { subject.land plane }
      expect(subject.land plane).to be_nil
    end
  end

  context 'when weather conditions are stormy' do

    before(:each) do
      Airport.any_instance.stub(:weather_condition).and_return('stormy')
    end
    # can't make the new rspec syntax to work

    it 'does not allow a plane to take off' do
      subject.land plane
      subject.take_off
      expect(subject.landing_strip.count).to eq(1)
    end

    xit 'does not allow a plane to land' do
      subject.land plane
      expect(subject.landing_strip.count).to eq(0)
    end
  end
end
