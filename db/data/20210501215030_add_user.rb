class AddUser < SeedMigration::Migration
  def up
    User.create!(full_name: 'Admin User',
                 email: 'admin@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 role: :admin)
                 
    User.create!(full_name: 'Editor User',
                 email: 'editor@example.com',
                 password: 'password',
                 password_confirmation: 'password',
                 role: :editor)
  end

  def down

  end
end
