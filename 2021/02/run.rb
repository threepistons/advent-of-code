#!/bin/ruby

require './lib/02.rb'

traj = Trajectory.new
traj.calculate('input.txt')
puts traj.product
