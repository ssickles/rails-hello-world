# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Joke.destroy_all

Joke.create!(
  [
    { joke_type: "general", setup: "What did the fish say when it hit the wall?", punchline: "Dam." },
    { joke_type: "general", setup: "What did the shark say when he ate the clownfish?", punchline: "This tastes a little funny." },
    { joke_type: "programming", setup: "What did the router say to the doctor?", punchline: "It hurts when IP." },
    { joke_type: "programming", setup: "Why did the programmer quit his job?", punchline: "Because he didn't get arrays." },
    { joke_type: "general", setup: "What did the buffalo say when his son left for college?", punchline: "Bison." },
  ]
)

ap "Created #{Joke.count} jokes"
