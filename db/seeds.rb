# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create 5 articles
article1 = Article.create!(content: "It's important to me that you're happy. Maybe we got a few little happy bushes here, just covered with snow. It's all a game of angles. Anytime you learn something your time and energy are not wasted. You can do anything your heart can imagine.

Do an almighty painting with us. We tell people sometimes: we're like drug dealers, come into town and get everybody absolutely addicted to painting. It doesn't take much to get you addicted. I guess that would be considered a UFO. A big cotton ball in the sky. Automatically, all of these beautiful, beautiful things will happen.")

article2 = Article.create!(content: "Steve wants reflections, so let's give him reflections. A big strong tree needs big strong roots. Imagination is the key to painting.

We'll put some happy little leaves here and there. Nothing's gonna make your husband or wife madder than coming home and having a snow-covered dinner. Let's get crazy. Let's do it again then, what the heck. Now it's beginning to make a little sense. There are no limits in this world.")

article3 = Article.create!(content: "This is an example of what you can do with just a few things, a little imagination and a happy dream in your heart. How do you make a round circle with a square knife? That's your challenge for the day. We can fix anything. Let's go up in here, and start having some fun We'll put all the little clouds in and let them dance around and have fun.

So often we avoid running water, and running water is a lot of fun. Making all those little fluffies that live in the clouds. Let the paint work. Just go back and put one little more happy tree in there. Let's put a touch more of the magic here.")

article4 = Article.create!(content: "I get carried away with this brush cleaning. Isn't that fantastic? You can just push a little tree out of your brush like that. Making all those little fluffies that live in the clouds. And just raise cain. The first step to doing anything is to believe you can do it. See it finished in your mind before you ever start. You can create anything that makes you happy.

Isn't that fantastic that you can make whole mountains in minutes? Without washing the brush, I'm gonna go right into some Van Dyke Brown, some Burnt Umber, and a little bit of Sap Green. How to paint. That's easy. What to paint. That's much harder. We don't want to set these clouds on fire. We'll play with clouds today. Tree trunks grow however makes them happy.")

article5 = Article.create!(content: "Maybe there's a little something happening right here. Let's build some happy little clouds up here. You can do it.

This present moment is perfect simply due to the fact you're experiencing it. It's a super day, so why not make a beautiful sky? It's life. It's interesting. It's fun. There isn't a rule. You just practice and find out which way works best for you. This is your world. Let's have a happy little tree in here.")

# create 3 categories
category1 = Category.create!(name: "The Kitchen")
category2 = Category.create!(name: "Critiques")
category3 = Category.create!(name: "K-Culture")

# create 5 tags
tag1 = Tag.create!(name: "lecreuset")
tag2 = Tag.create!(name: "staub")
tag3 = Tag.create!(name: "bts")
tag4 = Tag.create!(name: "politics")
tag5 = Tag.create!(name: "life")

# create 5 posts with article, categories, and tags
Post.create!(title: "Post #1", article: article1, categories: [category1], tags: [tag1, tag2], featured: true)

Post.create!(title: "Post #2", article: article2, categories: [category1], tags: [tag1, tag2])

Post.create!(title: "Post #3", article: article3, categories: [category2], tags: [tag5])

Post.create!(title: "Post #4", article: article4, categories: [category2], tags: [tag4])

Post.create!(title: "Post #5", article: article5, categories: [category3], tags: [tag3])
