# frozen_string_literal: true

# TODO: if operand is variable - check and use value
# if result is intermediate add new variable
# if result is output add new variable and add it in hash output_variable1
# return output after all

require 'json'
require_relative 'functions'
file = File.read('./config.json')
data = JSON.parse(file)

# TODO: convert variables into hash where keys is symbol
variables = data['variables']
expressions = data['expressions']
expressions.each do |expression|
  found = Functions.methods.include? expression['function'].to_sym
  if found
    p Functions
      .public_method(expression['function'].to_sym)
      .call(*expression['operands'])
  else
    p "method #{expression['function']} not found"
    next
  end
end
