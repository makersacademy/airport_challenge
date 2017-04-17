require 'airport'
require 'weather'

 describe Airport do

  it { is_expected.to respond_to :confirm_landed}
  it { is_expected.to respond_to :confirm_take_off}
  it { is_expected.to respond_to :weather_status? }

  it "confirms landing" do
    plane = Plane.new
    expect(subject.confirm_landed(plane)).to eq [plane]
  end

  it "confirms take off" do
    plane = Plane.new
    subject.confirm_landed(plane)
    expect(subject.confirm_take_off).to eq plane
  end

  describe "#prevent takeoff" do
    context 'stormy weather' do
      let (:weather) { double(:weather, stormy?: true)}
      let (:plane) { double(:plane) }
    it 'prevents takeoff when weather stormy' do
      #weather = Weather.new
      subject.confirm_landed(plane)
      #subject.weather_status?
      expect{ subject.confirm_take_off }.to raise_error('Cannot takeoff in stormy weather')
    end
  end
  end

  end
