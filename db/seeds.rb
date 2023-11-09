require 'open-uri'

Movie.destroy_all
List.destroy_all

# the Le Wagon copy of the API
url = 'http://tmdb.lewagon.com/movie/top_rated'
raw_response = URI.open(url).read
movies_attributes = JSON.parse(raw_response)

movies_attributes['results'].each do |movie_attribute|
  puts "***" * 20
  puts "Creating #{movie_attribute['original_title']}"
  # create an instance with the hash
  movie = Movie.create!(
    poster_url: "https://image.tmdb.org/t/p/w500" + movie_attribute['poster_path'],
    rating: movie_attribute['vote_average'],
    title: movie_attribute['original_title'],
    overview: movie_attribute['overview']
  )

  puts "Created #{movie.title} with ID #{movie.id}"
  puts "***" * 20
end
