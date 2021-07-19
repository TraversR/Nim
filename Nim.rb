#Travers Rollston
#Classic game of Nim



# Create and set array of piles
piles = Array[1 + rand(6), 1 + rand(6), 1 + rand(6)]

# Initialize additional variables
players = Array.new
keep_playing = true

# Get first player's name
print 'Player 1, enter your name >> '
players[0] = gets.chomp

# Get second player's name
print ' Player 2, enter your name >> '
players[1] = gets.chomp

# Set player flag to first player (variable stores index into player array)
current_player = 0

# begin game loop that runs as long as more than one stick exists
begin
  # Display pile counts
  puts "\nA: #{piles[0]}  B: #{piles[1]}  C: #{piles[2]}\n\n"

  pile_is_valid = false

  begin  #loop to get valid pile choice from user

    # get choice
    print "#{players[current_player]}, choose a pile >>"
    pile_choice = gets.chomp.upcase

    # if letter invalid, tell user to repeat, otherwise map the letter to array.
    if pile_choice == 'A'
      pile_index = 0
    elsif pile_choice == 'B'
      pile_index = 1
    elsif  pile_choice == 'C'
      pile_index = 2
    else
      puts "\nInvalid choice. You must enter A, B, or C.\n\n"
      pile_index = -1
    end
    # if letter is valid but pile is empty, tell user to choose another pile
    if pile_index >= 0
      if piles[pile_index] == 0
        puts "\n#{players[current_player]}, That pile is empty. Try again."
      else
        pile_is_valid = true
      end
    end
    # end pile choice loop
  end while !pile_is_valid

  count_is_valid = false

  begin  # loop to get valid stick count from user

    # get count
    print "How many sticks do you want to take from pile #{pile_choice}"
    item_count = gets.to_i

    # make sure count is between 1 and max value for chosen pile
    if item_count < 1  # Make sure user wants at least 1 stick
      puts "\nYou must choose at least 1 stick\n\n"
    elsif item_count > piles[pile_index] #make sure user isn't taking too many sticks
      puts "\nPile #{pile_choice} doesn't have that many sticks. Try again."
    elsif item_count == piles.sum # make sure user isn't taking all remaining sticks in game
      puts "\nYou cannot take all the sticks or you will lose. You must leave at least 1."
    else
      count_is_valid = true
    end


  end while !count_is_valid

  #remove items from pile
  piles[pile_index] -= item_count

  # Checks to see if we should keep playing
  keep_playing = piles.sum > 1

  # Switch to next player
  if keep_playing
    current_player ^= 1   # toggle current player from 1 to 0 or 0 to 1
  end

  # loop if game should keep going
end while keep_playing

# display winner and loser
puts "\n#{players[current_player]}, you win! Sorry, #{players[current_player^1]} "
puts "your only option would be the last remaining stick."

puts "To exit, press enter."

enter = gets



