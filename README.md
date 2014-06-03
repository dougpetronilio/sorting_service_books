= sorting_service_books

Esta gem foi desenvolvida para ordenar um array de books utilizando varias condições.
Podemos ordenar por qualquer atributo da classe Book(title, author, edition) de forma ascendente ou descendente.
Podemos usar arquivos yaml para configurar como será essa ordenação e carregar o array de Books ou podemos
fazer essas configurações via software. Na pasta bin temos os dois exemplos de como fazer isso.

= Como utilizar

== Via software:

para instalar:
```ruby
	gem install sorting_service_books
	require "sorting_service_books"
```

para criar a biblioteca de Books via software:

```ruby
	books = []
	books << SortingServiceBooks::Book.new("Java How to Program", "Deitel & Deitel", "2007")
	books << SortingServiceBooks::Book.new("Patterns of Enterprise Application Architecture", "Martin Fowler", "2002")
	books << SortingServiceBooks::Book.new("Head First Design Patterns", "Elisabeth Freeman", "2004")
	books << SortingServiceBooks::Book.new("Internet & World Wide Web: How to Program", "Deitel & Deitel", "2007")
```

para criar as condições via software:

```ruby
	conditions = []
	conditions << SortingServiceBooks::Order.new(:edition, :desc)
	conditions << SortingServiceBooks::Order.new(:author, :desc)
	conditions << SortingServiceBooks::Order.new(:title, :asc)
```

para pegar o array ordenado:

```ruby
	sort_books = SortingServiceBooks::SortBooks.new(books, conditions)
	sort_books.sort
```

== Via Arquivo de configuração:

código:

```ruby
	require "sorting_service_books"
	client = SortingServiceBooks::Client.new("config_one_condition.yml")
	client.sort
```

Para configurar o arquivo yml:


```yaml
	conditions:
	    -
	        key: !ruby/symbol author
	        value: !ruby/symbol asc

	    -
	        key: !ruby/symbol title
	        value: !ruby/symbol desc

	books:
	    -
	        title: 'Java How to Program'
	        author: 'Deitel & Deitel'
	        edition: '2007'
	    -
	        title: 'Patterns of Enterprise Application Architecture'
	        author: 'Martin Fowler'
	        edition: '2002'
	    -
	        title: 'Head First Design Patterns'
	        author: 'Elisabeth Freeman'
	        edition: '2004'
	    -
	        title: 'Internet & World Wide Web: How to Program'
	        author: 'Deitel & Deitel'
	        edition: '2007'
```

== Contributing to sorting_service_books
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2014 Douglas Petronilio. See LICENSE.txt for
further details.

