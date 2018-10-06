Dir["./feature_tests/*.rb"].sort.each{ |file|
  puts "\n**** #{file} ****"
  begin
   require file
  rescue
     puts "Feature test returned and error"
  end
  }
