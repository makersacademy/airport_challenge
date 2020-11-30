require 'weather'

describe Weather do
  it 'can create an instance of weather' do
    weather = Weather.new
    expect(weather).to be_kind_of(Weather)
  end


  describe '#stormy?' do
    it 'returns true when RNG is 1' do
      stub = Weather.new

      allow(stub).to receive(:rand) { 1 }

      expect(stub.stormy?).to be true
    end

  end

end

  # describe Weather do
  #   it 'raises an error if a plain tries to take off during stormy weather'
  #   expect(subject.stormy?)
  # end

  # describe '#stormy' do
  #   it 'raises an error when true' do
  #     subject.stormy? { subject.land(Plane.new) }
  #     expect { subject.land(Plane.new) }.to raise_error 'Airport full'
  #   end
  # end
