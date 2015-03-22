require 'capybara/rspec'

feature 'Grand Finale' do
  let(:planes) do
    planes = []
    6.times { planes << Plane.new }
    planes
  end

  let(:airport) { Airport.new(capacity: 7) }

  scenario 'all planes land' do
    allow(airport).to receive(:bad_weather?).and_return(false)
    planes.each do |plane|
      airport.land plane
    end
    expect(planes).to be_all { |plane| plane.status == 'landed' }
  end

  scenario 'plane rejected due to bad weather' do
    allow(airport).to receive(:bad_weather?).and_return(true)
    expect { airport.land Plane.new }.to raise_error # Be more specific
  end

  feature 'airport is full' do
    let(:airport) do
      airport = Airport.new(climate: 2)
      allow(airport).to receive(:bad_weather?).and_return(false)
      planes.each do |plane|
        airport.land plane
      end
      airport
    end

    feature 'another plane tries to land' do
      scenario 'and is rejected' do
        expect { airport.land Plane.new }.to raise_error
      end

      scenario 'but is rejected and continues flying' do
        rejected_plane = Plane.new
        expect { airport.land Plane.new }.to raise_error
        expect(rejected_plane.status).to eq 'flying'
      end
    end

    scenario 'all planes can take off' do
      planes.each do |plane|
        airport.take_off plane
      end
      expect(planes).to be_all { |plane| plane.status == 'flying' }
    end
  end
end
