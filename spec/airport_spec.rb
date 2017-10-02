require 'airport'
require 'plane'


class FakePlane

  def taken_off
    'Taken-off, plane in air'
  end

  def landed
    'Plane landed!'
  end

end

class FakeWeather

end

describe Airport do
  let(:weather) { double :weather }

  describe '#landing plane tests' do
    it { is_expected.to respond_to(:land).with(1).argument }
    it "returns the landed plane" do
      plane = FakePlane.new
      expect(subject.land(plane)).to eq 'Plane landed!'
    end
    it "raises an error when you try to land the same plane twice" do
      plane = FakePlane.new
      subject.land(plane)
      expect {subject.land plane}.to raise_error "Cannot land the same plane"
    end
  end


  describe '#capacity tests' do
    it "has a default capacity" do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
    it 'raises an error when airport is full' do
      subject.capacity.times { subject.land(FakePlane.new) }
      expect {subject.land FakePlane.new }.to raise_error "Airport is full!"
    end
  end


  describe '#taking-off plane tests' do
    it { is_expected.to respond_to(:take_off) }
  end
  it "returns the take-off plane" do
    plane = FakePlane.new
    subject.land(plane)
    expect(subject.take_off).to eq 'Taken-off, plane in air'
  end
  it "raises and error attempting to take_off a plane that does not exist " do
    expect {subject.take_off}.to raise_error "no planes available for take-off!"
  end
  it { is_expected.to respond_to :weather }
  it "raises error when stormy weather and prevents take_off" do

  end

end
