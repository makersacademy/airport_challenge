require 'plane'
require 'airport'
require 'weather'
require 'capybara/rspec'

feature 'Airport Challenge ' do
  let(:weather) { double('weather', stormy?: false) }
  let(:stormy) { double('weather', stormy?: false) }

  scenario 'Land and Take off' do
    airbus = Plane.new
    gatwick = Airport.new
    airbus.weather_report(weather)
    puts "Status before landing: #{airbus.status}"
    airbus.land(gatwick)
    puts "Status after landing: #{airbus.status}"
    airbus.take_off(gatwick)
    puts "Status after take off: #{airbus.status}"

  end

  scenario 'Confirming plane is not in airport before landing and after take off' do
    airbus = Plane.new
    gatwick = Airport.new
    airbus.weather_report(weather)
    puts "Airport Collection before landing: #{gatwick.planes}"
    airbus.land(gatwick)
    puts "Airport Collection after landing: #{gatwick.planes}"
    airbus.take_off(gatwick)
    puts "Airport Collection after take off: #{gatwick.planes}"
  end

  scenario 'Confirming weather will change randomly to stormy around 30%' do
    array = []
    10.times { array.push(Weather.new) }
    count = 0
    array.each { |x| count += 1 if x.stormy? }
    puts "Weather is stormy #{count} times out of 10"
  end

  scenario 'Airports capacity can be set' do
    gatwick = Airport.new(30)
    puts "Airport has a capacity of #{gatwick.capacity}"
  end

  scenario 'full test with various planes and airports' do
    heathrow = Airport.new(10)
    gatwick = Airport.new
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    plane4 = Plane.new
    plane5 = Plane.new
    plane6 = Plane.new
    plane1.weather_report(weather)
    plane2.weather_report(weather)
    plane3.weather_report(weather)
    plane4.weather_report(weather)
    plane5.weather_report(weather)
    plane6.weather_report(weather)
    plane1.land(gatwick)
    plane2.land(gatwick)
    plane3.land(gatwick)
    plane4.land(gatwick)
    expect { plane4.land(gatwick) }.to raise_error("Plane already landed")
    plane5.land(heathrow)
    plane6.land(heathrow)
    expect { plane5.take_off(gatwick) }.to raise_error("Plane not in airport")
    plane5.take_off(heathrow)
    expect { plane5.land(gatwick) }.to raise_error("Airport full")
  end
end
