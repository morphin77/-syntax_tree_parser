=begin
ToDo if operand is variable - check and use value
if result is intermediate add new variable
if result is output add new variabl and add it in hash output_variable1
return output after all
=end

require "json"
require_relative "functions"
functions = Functions.new
file = File.read("./config.json")
data = JSON.parse(file)

#ToDo: convert variables into hash where keys is symbol
variables = data['variables']
expressions = data['expressions']
expressions.each do |expression|
  finded = Functions.instance_methods.include? expression["function"].to_sym
  if finded
    p functions.method(expression["function"]).call(*expression["operands"])
  else
    p "method #{expression["function"]} not found"
    next
  end
end
