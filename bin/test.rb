#!/usr/bin/env ruby

require "sorting_service_books"


client = SortingServiceBooks::Client.new("config_one_condition.yml")
puts "*"*50
client.books.each { |c| puts c.title }
puts "-"*50
client.sort.each { |c| puts c.title }
puts "*"*50
puts

client = SortingServiceBooks::Client.new("config_two_conditions.yml")
puts "*"*50
client.books.each { |c| puts c.title }
puts "-"*50
client.sort.each { |c| puts c.title }
puts "*"*50
puts

client = SortingServiceBooks::Client.new("config_three_conditions.yml")
puts "*"*50
client.books.each { |c| puts c.title }
puts "-"*50
client.sort.each { |c| puts c.title }
puts "*"*50

