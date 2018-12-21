#!/usr/bin/env ruby

# TODO: Convert this into a Rakefile; I have no idea how rake works but I need to learn

system("cd src; bundle install")

system("cd src; ruby bot.rb #{ARGV.join(' ')}")