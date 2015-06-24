# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ABOUT = "At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, 
quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui 
officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. 
Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus,
 omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut  et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis
doloribus asperiores repellat."

Category.create! id:1, title: "New Category"
Category.create! id:2, title: "New Category"

Book.create! id: 1, title: "Book1", price: 20.0, count: 40, year: 1995, isnb: 1111111111111, about: ABOUT, category_id: 1
Book.create! id: 2, title: "Book2", price: 40.0, count: 40, year: 1995, isnb: 1111111111111, about: ABOUT, category_id: 1
Book.create! id: 3, title: "Book3", price: 60.0, count: 40, year: 1995, isnb: 1111111111111, about: ABOUT, category_id: 1

Author.create! id: 1, name: "Auth1", about: ABOUT
Author.create! id: 2, name: "Auth2", about: ABOUT