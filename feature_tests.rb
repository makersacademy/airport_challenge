def red(mytext); "\e[31m#{mytext}\e[0m"; end

Dir["./feature_tests/*.rb"].sort_by { |m| m.scan(/\d+/)[0].to_i }.each { |file|
  puts "\n**** #{file} ****"
  begin
    require file
  rescue StandardError
    puts red("Feature test returned an error")
  end
}
