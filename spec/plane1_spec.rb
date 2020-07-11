require_relative '../lib/plane'

describe Plane do
    describe '#flying?' do
        it {is_expected.to respond_to :flying?}
    end

    describe '#flying' do
        it 'will overwrite flying status to true' do
            plane1 = Plane.new.flying
            expect(plane1.flying?).to eq true
        end
    end

    describe '#landed'
    it 'once a plan has landed at an airport flying? will return false' do
        plane1 = Plane.new(true)
        allow(Airport::WEATHER_CONDITIONS).to receive(:sample).and_return("sunny")
        airport1 = Airport.new
        expect(airport1.land(plane1).last.flying?).to eq false   
    end
end