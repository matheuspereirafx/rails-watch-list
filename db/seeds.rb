# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all

puts "Creating movies..."

Movie.create!(
  title: "The Shawshank Redemption",
  overview: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.",
  poster_url: "https://image.tmdb.org/t/p/w500/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg",
  rating: 8.7
)

Movie.create!(
  title: "The Godfather",
  overview: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
  poster_url: "https://image.tmdb.org/t/p/w500/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
  rating: 8.7
)

Movie.create!(
  title: "Inception",
  overview: "A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.",
  poster_url: "https://image.tmdb.org/t/p/w500/9gk7adHYeDvHkCSEqAvQNLV5Uge.jpg",
  rating: 8.4
)

Movie.create!(
  title: "The Dark Knight",
  overview: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests.",
  poster_url: "https://image.tmdb.org/t/p/w500/qJ2tW6WMUDux911r6m7haRef0WH.jpg",
  rating: 8.5
)

Movie.create!(
  title: "Pulp Fiction",
  overview: "The lives of two mob hitmen, a boxer, a gangster and his wife intertwine in four tales of violence and redemption.",
  poster_url: "https://image.tmdb.org/t/p/w500/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg",
  rating: 8.3
)

Movie.create!(
  title: "Forrest Gump",
  overview: "The presidencies of Kennedy and Johnson, the Vietnam War, and other historical events unfold from the perspective of an Alabama man.",
  poster_url: "https://image.tmdb.org/t/p/w500/saHP97rTPS5eLmrLQEcANmKrsFl.jpg",
  rating: 8.2
)

Movie.create!(
  title: "The Matrix",
  overview: "A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.",
  poster_url: "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg",
  rating: 8.1
)

Movie.create!(
  title: "Interstellar",
  overview: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
  poster_url: "https://image.tmdb.org/t/p/w500/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg",
  rating: 8.6
)

puts "Created #{Movie.count} movies!"

puts "Creating lists..."

action = List.create!(name: "Action & Adventure")
scifi = List.create!(name: "Sci-Fi Classics")
drama = List.create!(name: "Must-Watch Dramas")

puts "Created #{List.count} lists!"

puts "Creating bookmarks..."

Bookmark.create!(movie: Movie.find_by(title: "The Dark Knight"), list: action, comment: "Best superhero movie ever!")
Bookmark.create!(movie: Movie.find_by(title: "Inception"), list: action, comment: "Mind-bending action sequences!")

Bookmark.create!(movie: Movie.find_by(title: "The Matrix"), list: scifi, comment: "Revolutionary sci-fi masterpiece")
Bookmark.create!(movie: Movie.find_by(title: "Interstellar"), list: scifi, comment: "Stunning visuals and emotional depth")
Bookmark.create!(movie: Movie.find_by(title: "Inception"), list: scifi, comment: "Dreams within dreams!")

Bookmark.create!(movie: Movie.find_by(title: "The Shawshank Redemption"), list: drama, comment: "Hope is a good thing, maybe the best of things")
Bookmark.create!(movie: Movie.find_by(title: "The Godfather"), list: drama, comment: "An offer you can't refuse")
Bookmark.create!(movie: Movie.find_by(title: "Forrest Gump"), list: drama, comment: "Life is like a box of chocolates")

puts "Created #{Bookmark.count} bookmarks!"
puts "Seed completed! 🎬"
