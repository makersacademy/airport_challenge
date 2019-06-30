require './lib/air-traffic-control.rb'
require './lib/weather.rb'
require './lib/plane.rb'
require './lib/airport.rb'

airport = Airport.new
atc = AirTrafficControl.new
weather = Weather.new
plane = Airplane.new

atc.connect_with_airside_ops(airport)
atc.get_weather_status(weather)
plane.is_flying
atc.pre_land_checks(plane)
airport.hangar_storage_report

plane1 = Airplane.new
plane1.is_flying
atc.pre_land_checks(plane1)
airport.hangar_storage_report

plane2 = Airplane.new
plane2.is_flying
atc.pre_land_checks(plane2)

plane3 = Airplane.new
plane3.is_flying
atc.pre_land_checks(plane3)

plane4 = Airplane.new
plane4.is_flying
atc.pre_land_checks(plane4)

plane5 = Airplane.new
plane5.is_flying
atc.pre_land_checks(plane5)

plane6 = Airplane.new
plane6.is_flying
atc.pre_land_checks(plane6)

plane7 = Airplane.new
plane7.is_flying
atc.pre_land_checks(plane7)

plane8 = Airplane.new
plane8.is_flying
atc.pre_land_checks(plane8)

plane9 = Airplane.new
plane9.is_flying
atc.pre_land_checks(plane9)

airport.hangar_storage_report

plane10 = Airplane.new
plane10.is_flying
atc.pre_land_checks(plane10)

atc.pre_take_off_checks(plane4)

plane4.flying?

airport.hangar_storage_report

atc.pre_take_off_checks(plane10)

airport.hangar_plane_count