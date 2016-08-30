# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin_1 = User.create(name: "Admin1", email: "admin1@jobwalk.com", password: "test123", role: 'admin')
admin_2 = User.create(name: "Admin2", email: "admin2@jobwalk.com", password: "test123", role: 'admin')
user_jane = User.create(name: "Jane", email: "jane@jobwalk.com", password: "test123", role: 'collaborator')
user_joe = User.create(name: "Joe", email: "joe@jobwalk.com", password: "test123", role: 'collaborator')


# Add projects to admin 1
4.times do |idx|
  license = "idx#{idx}"
  admin_1.projects.create(
          name: "Test Project #{idx + 1}",
          license: license,
          description: "This is a description for Project #{idx + 1}"
          )
end

# Add users to projects in various ways
admin_1.projects[0].users << user_joe
admin_1.projects[0].users << user_jane
admin_1.projects[0].users << admin_2

admin_1.projects[1].users << user_joe
admin_1.projects[2].users << user_jane

#Areas to project
project = admin_1.projects[0]

3.times do |n|
  project.areas.create(
      name: "Test Area #{n + 1}",
      description: "Foo",
      floor_plan: File.open(File.join(Rails.root,'reference_documents', 'Sample_PDFs', 'sample_floor_plan.pdf' ))
  )
end
