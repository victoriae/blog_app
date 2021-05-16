class AddArticle < SeedMigration::Migration
  def up
    categories = Category.all
    users = User.all
    25.times do
      a = Article.create(
        category: categories[rand(5)],
        title: Faker::Lorem.sentence(word_count: 10, supplemental: false, random_words_to_add: 5),
        user: users[rand(2)],
        active: 1
      )
      a.content = "<div>#{Faker::Lorem.sentence(word_count: 150, supplemental: false, random_words_to_add: 50)}<br><br>#{Faker::Lorem.sentence(word_count: 150, supplemental: false, random_words_to_add: 50)}</div>"
      a.save!
    end
  end

  def down

  end
end
