# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length
    k = 0
    while k < aoa[i].length
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# Your code after this point

def movies_with_director_key(name, movies_collection)
  arr = []
  i = 0
  len = movies_collection.length
  while i < len
    arr << movie_with_director_name(name, movies_collection[i])
    i += 1
  end
  return arr
end

def gross_per_studio(collection)
  result = {}
  i = 0
  len = collection.length
  while i < len
    studio_name = collection[i][:studio]
    studio_gross = collection[i][:worldwide_gross]
    if !result[studio_name]
      result[studio_name] = studio_gross
    else
      result[studio_name] += studio_gross
    end
    i += 1
  end
  return result
end

def movies_with_directors_set(source)
  arr = []
  i = 0
  len1 = source.length
  while i < len1
    j = 0
    inner_arr = []
    len2 = source[i][:movies].length
    while j < len2
      director_name = source[i][:name]
      movie_data = source[i][:movies][j]
      inner_arr << movie_with_director_name(director_name, movie_data)
      j += 1
    end
    arr << inner_arr
    i += 1  
  end
  return arr
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
