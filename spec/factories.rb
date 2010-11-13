
Factory.define :post do |o|
  o.title 'a day in the life'
  o.body 'lorem ipsum dolores'*5
end
Factory.define :comment do |o|
  o.body 'lorem ipsum comment'
end
