#!/usr/bin/env ruby

require 'bundler/setup'
$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require "sorting_service_books"


books = []
books << SortingServiceBooks::Book.new("Java How to Program", "Deitel & Deitel", "2007")
books << SortingServiceBooks::Book.new("Patterns of Enterprise Application Architecture", "Martin Fowler", "2002")
books << SortingServiceBooks::Book.new("Head First Design Patterns", "Elisabeth Freeman", "2004")
books << SortingServiceBooks::Book.new("Internet & World Wide Web: How to Program", "Deitel & Deitel", "2007")

conditions1 = []
conditions1 << SortingServiceBooks::Order.new(:title, :asc)

conditions2 = []
conditions2 << SortingServiceBooks::Order.new(:author, :asc)
conditions2 << SortingServiceBooks::Order.new(:title, :desc)

conditions3 = []
conditions3 << SortingServiceBooks::Order.new(:edition, :desc)
conditions3 << SortingServiceBooks::Order.new(:author, :desc)
conditions3 << SortingServiceBooks::Order.new(:title, :asc)

sort_books1 = SortingServiceBooks::SortBooks.new(books, conditions1)
sort_books2 = SortingServiceBooks::SortBooks.new(books, conditions2)
sort_books3 = SortingServiceBooks::SortBooks.new(books, conditions3)

sort_books1.books.each {|book| puts book.title+"--"+book.author+"--"+book.edition}
puts "_"*50
sort_books1.sort.each {|book| puts book.title+"--"+book.author+"--"+book.edition}
puts "#"*50
puts

sort_books2.books.each {|book| puts book.title+"--"+book.author+"--"+book.edition}
puts "_"*50
sort_books2.sort.each {|book| puts book.title+"--"+book.author+"--"+book.edition}
puts "#"*50
puts

sort_books3.books.each {|book| puts book.title+"--"+book.author+"--"+book.edition}
puts "_"*50
sort_books3.sort.each {|book| puts book.title+"--"+book.author+"--"+book.edition}
puts "#"*50
