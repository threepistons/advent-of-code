#!/bin/ruby

require './lib/01.rb'

di = DepthIncreases.new
di.calculate('input.txt')
puts di.total

di.threes('input.txt')
puts di.total
