$LOAD_PATH.unshift(File.dirname(__FILE__))
require_relative './directors_database'

def directors_totals(source)
  result = {}
  director_index = 0
  while director_index < source.size do
    director = source[director_index]
    result[director[:name]] = gross_for_director(director)
    director_index += 1
  end
  result
end

def gross_for_director(d)
  total = 0
  index = 0
  while index < d[:movies].length do
    total += d[:movies][index][:worldwide_gross]
    index += 1
  end
  total
end

def list_of_directors(source)
  #source is an array of hashes
  result = []
  source_index = 0
  while source_index < source.length do
    result.push(source[source_index][:name])
    source_index += 1
  end
  return result
end

def total_gross(source)
  # Write this implementation
  #
  # Should use methods:
  # 1. directors_totals: returns a Hash of { dir_name => gross }
  # 2. list_of_directors: names provides an Array of directors names (use
  #
  # Visit each key (i.e. director name), look up the value in the hash
  # returned by directors_totals, and add it to a running total. When done,
  # return the total
  
  #source is array of hashes
  running_total = 0
  dir_array = list_of_directors(source)
  dir_ind = 0
  while dir_ind < dir_array.length do
    running_total += directors_totals(dir_array[dir_ind])
    dir_ind += 1
  end
  puts ">>>" 
  puts running_total
  return running_total  
end

