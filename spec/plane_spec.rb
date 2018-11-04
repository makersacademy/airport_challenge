require 'plane'

describe Plane do
  let(:stormy_airport) { double("stormy_airport", :stormy_weather => true) }
  let(:sunny_airport) { double("sunny_airport", :stormy_weather => false, :land => "airport", :take_off => "air") }

  it 'is in the air once initialized' do
    expect(subject.location).to eq("air")
  end

end
