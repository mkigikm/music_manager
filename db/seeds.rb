# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(
  email: "matt@capitolrecords.com",
  password: "password",
  activated: true
)
User.create!(
  email: "thom@capitolrecords.com",
  password: "maggiesux",
  activated: true
)
User.create!(
  email: "johnny@capitolrecords.com",
  password: "imakesoundtracks",
  activated: true
)
User.create!(
  email: "aholeexec@capitolrecords.com",
  password: "bankbaby",
  activated: true
)

radiohead = Band.create!(name: "Radiohead")
theclash  = Band.create!(name: "The Clash")
cake      = Band.create!(name: "Cake")
afp       = Band.create!(name: "Amanda Palmer")

kida     = Album.create!(
             title: "Kid A",
             band_id: radiohead.id,
             studio: true
           )
thebends = Album.create!(
             title: "The Bends",
             band_id: radiohead.id,
             studio: true
           )
sandanis = Album.create!(
             title: "Sandanista!",
             band_id: theclash.id,
             studio: true
           )
fashion  = Album.create!(
             title: "Fashion Nugget",
             band_id: cake.id,
             studio: true
           )
songsof  = Album.create!(
             title: "Amanda Palmer Performs the Popular Hits of Radiohead on Her Magical Ukulele",
             band_id: afp.id,
             studio: false
           )

[
  "Everything In Its Right Place",
  "Kid A",
  "The National Anthem"
].each do |title|
  Track.create!(
    title: title,
    album_id: kida.id,
    bonus: false
  )
end

[
  "Planet Telex",
  "The Bends",
  "High and Dry"
].each do |title|
  Track.create!(
    title: title,
    album_id: thebends.id,
    bonus: false
  )
end

[
  "The Magnificent Seven",
  "Hitsville U.K.",
  "Junco Partner"
].each do |title|
  Track.create!(
    title: title,
    album_id: sandanis.id,
    bonus: false
  )
end

[
  "Frank Sinatra",
  "The Distance",
  "Friend Is A Four Letter Word"
].each do |title|
  Track.create!(
    title: title,
    album_id: fashion.id,
    bonus: false
  )
end

[
  "Fake Plastic Trees",
  "High And Dry",
  "No Surprises"
].each do |title|
  Track.create!(
    title: title,
    album_id: songsof.id,
    bonus: false
  )
end

Track.create!(
  title: "Creep",
  album_id: songsof.id,
  bonus: true
)
