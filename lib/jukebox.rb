# Add your code here

require 'pry' 

def help 
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def play (songs)
  puts "Please enter a song name or number:"
  choice = get_selection
  if invalid_choice?(choice, songs)
    puts "Invalid input, please try again"
  else
    song_id = get_song_id(choice, songs)
    puts song_id
  end
end

def get_song_id (choice,songs)
  if songs.any? (choice)
    song_id = choice
  else
    song_id = songs[(choice.to_i - 1)]
  end
  song_id
end
    
    
def get_selection
  selection = gets.strip
  selection
end

def invalid_choice?(selection, songs)
  if songs.any? (selection)
    return false
  elsif (selection.to_i > 0) && (selection.to_i < songs.length)
    return false
  else
    return true 
  end
end

def list(songs)
  songs.each_with_index do |song, index|
    puts (index+1).to_s + ". #{song}"
  end
end

def exit_jukebox
  puts "Goodbye"
end 

def run (songs)
  # run_init
  # selection = menu_selection
  selection = ""
  until selection == "exit"
    run_init
    selection = menu_selection
    while invalid_selection? (selection)
      "Invalid command"
      run_init
      selection = menu_selection
    end
    
    if selection == "play"
      play(songs)
    elsif selection == "list"
      list(songs)
    elsif selection == "help"
      help
    else
      break
    end
  end
  exit_jukebox
end

def run_init
  puts "Please enter a command: "
end

def menu_selection
  selection = gets.strip
  selection
end

def invalid_selection?(selection)
  possible_options = ["help","play","list","exit"]
  if possible_options.any?(selection) 
    return false
  else
    return true
  end
end

  
