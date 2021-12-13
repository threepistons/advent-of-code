#!/bin/ruby

require './lib/02.rb'

traj = Trajectory.new('input.txt')
traj.calculate
puts 'Part One: ' + traj.product.to_s
traj.parttwo
puts 'Part Two: ' + traj.product.to_s
