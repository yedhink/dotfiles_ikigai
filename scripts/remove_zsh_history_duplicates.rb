original_history_file = File.expand_path('~/.zsh_history')

new_history_file = File.expand_path('~/zsh_history_no_dups')

lines = File.readlines(original_history_file, encoding: 'ISO-8859-1')

# Create a hash to store the last occurrence of each command
commands = {}

lines.each_with_index do |line, index|
  # Force the encoding to UTF-8, replacing invalid byte sequences
  line = line.encode('UTF-8', invalid: :replace, undef: :replace, replace: '')

  # Zsh history lines are typically formatted as: ": 1424880980:0;command"
  next unless line =~ /^: \d+:\d+;(.*)$/

  command = Regexp.last_match(1).strip
  # Store the index of the last occurrence of the command
  commands[command] = index
end

# Extract the lines corresponding to the last occurrence of each command
unique_lines = commands.values.sort.map { |index| lines[index] }

File.open(new_history_file, 'w') do |file|
  file.puts(unique_lines)
end

puts "Duplicate entries removed. The new history file is saved as #{new_history_file}."
