require 'plane'
describe Plane do
  it 'has a method that checks if it has landed' do
    expect(subject).to respond_to(:landed?)
  end

  it 'reports as not landed before being landed by Airport' do
    expect(subject).not_to be_landed
  end

  it 'reports landed after being landed by Airport' do
    airport =  Airport.new
    airport.land(subject)
    expect(subject).to be_landed
  end
  describe '#land_plane' do
    it 'has a method to mark plane as landed' do
      expect(subject).to respond_to(:land_plane)
    end

    it 'marks plane as landed' do
      subject.land_plane
      expect(subject.landed?).to eq true
    end
  end

end
