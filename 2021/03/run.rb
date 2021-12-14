#!/bin/ruby

require './lib/03.rb'

power = Power.new('input.txt')
power.calculate
puts 'Part One: ' + power.product.to_s
#traj.parttwo
#puts 'Part Two: ' + traj.product.to_s
