Dir["./feature_tests/*.rb"].sort.each { |file|
  puts "\n**** #{file} ****"
  require file
  puts "passed"
 }

 puts "\n\nAll tests passed."
