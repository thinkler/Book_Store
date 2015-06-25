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

Category.create title: "Category1"
Category.create title: "Category2"

for i in 1..5 do 
  category_num = rand(2) + 1
  Book.create title: "Book#{i}", price: 20.0, count: 40, year: 1995, isnb: 1111111111111, about: ABOUT, category_id: category_num, book_img: File.new("app/assets/images/Poster.jpg")
end

for i in 1..5 do 
  Author.create name: "Author#{i}", about: ABOUT, photo: File.new("app/assets/images/Author.jpg")
end
