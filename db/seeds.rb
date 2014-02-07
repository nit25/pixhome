# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



tags = [
	{:content => "sports"},
	{:content => "movie"},
	{:content => "music"},
	{:content => "football"},
	{:content => "blues"},
	{:content => "Tom Brady"},
	{:content => "Frank Lampard"},
	{:content => "Steve Nash"}
]
tags.each do |tag|
		t = Tag.new
		t.content = tag[:content]
		t.save
end



