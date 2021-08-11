#!/usr/bin/env ruby
# frozen_string_literal: true

require "active_support/core_ext/integer/time"

loop do
  puts "What do you want to drink? beer or juice — nothing if you want to leave:"
  print "> "

  input = gets.chomp.downcase

  if input == "nothing"
    puts "Goodbye buddy!"
    break
  end

  if input == "juice"
    puts "The bartender gives you a nice juice; refreshing!"
    next
  end

  if input == "beer"
    puts "I would need to see an ID, please. What is your birthdate? (yyyy-mm-dd)"
    print "> "

    raw_birthdate = gets.chomp

    begin
      birthdate = Date.strptime(raw_birthdate, '%Y-%m-%d')

      if birthdate + 18.years <= Date.today
        puts "The bartender gives you a beer; drink in moderation!"
      else
        puts "You can't have a beer, kiddo."
      end
    rescue Date::Error
      puts "I can't read your ID, son."
    end
  end
end
