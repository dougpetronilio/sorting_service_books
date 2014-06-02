#!/usr/bin/env ruby

require 'bundler/setup'
require "sorting_service_books"


client = Client.new("../config_one_condition.yml")
puts "*"*50
puts client.books
puts client.sort
puts "*"*50

client = Client.new("../config_two_conditions.yml")
puts "*"*50
puts client.books
puts client.sort
puts "*"*50

client = Client.new("../config_three_conditions.yml")
puts "*"*50
puts client.books
puts client.sort
puts "*"*50

