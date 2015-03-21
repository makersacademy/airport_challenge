require 'capybara/rspec'

feature 'Grand Finale' do
  let(:planes) do
    planes = []
    6.times { planes << Plane.new }
    planes
  end
  let(:airport) { Airport.new(capacity: 7, climate: 2) }

  scenario 'all planes land' do
    planes.each do |plane|
      begin
        airport.land plane
        # rescue BadWeatherError => e
        #   puts e.message
        #   retry
      end
    end
    expect(planes).to be_all { |plane| plane.status == 'landed' }
  end

  scenario 'plane rejected due to bad weather' do
    allow(airport).to receive(:weather_bad?).and_return(true)
    expect { airport.land Plane.new }.to raise_error # Be more specific
  end

  feature 'airport is full' do
    let(:airport) do
      airport = Airport.new(climate: 2)
      planes.each do |plane|
        begin
          airport.land plane
          # rescue BadWeatherError => e
          #   puts e.message
          #   retry
        end
      end
      airport
    end

    feature 'airport full as default capacity is reached' do
      scenario 'another plane is rejected' do
        expect { airport.land Plane.new }.to raise_error
      end
      scenario 'plane continues flying' do
        rejected_plane = Plane.new
        expect { airport.land Plane.new }.to raise_error
        expect(rejected_plane.status).to eq 'flying'
      end
    end

    scenario 'all planes can take off' do
      planes.each do |plane|
        begin
          airport.take_off plane
          # rescue BadWeatherError => e
          #   puts e.message
          #   retry
        end
      end
      expect(planes).to be_all { |plane| plane.status == 'flying' }
    end
  end
end
