class AddCategory < SeedMigration::Migration
  def up
    5.times do
      Category.create(
        name: Faker::ProgrammingLanguage.name,
        description: Faker::Lorem.sentence(word_count: 20, supplemental: false, random_words_to_add: 5)
      )
    end
  end

  def down

  end
end
