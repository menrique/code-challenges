def run(examples)
  return puts("\nNOT BLOCK GIVEN") unless block_given?

  puts "\nEXAMPLES"
  expected_results = []
  collected_results = examples.map do |input, output|
    expected_results += [output]
    result = yield(input)
    puts "#{input} => #{output} : #{result} [#{result == output ? 'Ok' : 'Error'}]"
    result
  end

  puts "\nRESULT"
  puts "#{collected_results == expected_results ? "Ok" : "Error"}"
end