require_relative 'Factory.rb'

Customer = Factory.new(:name, :address, :zip)

joe = Customer.new('Joe Smith', '123 Maple, Anytown NC', 12345)

p joe.name
p joe['name']
p joe[:name]
p joe[0]

Customer2 = Factory.new(:name, :address)

p Customer2.new('Dave', '123 Main').greeting