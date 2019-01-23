#create seed data to test associations

#Create 4 homeowners

avi = Homeowner.create(first_name: "Avi", last_name: "Flombaum", email: "avi@flatiron.org", password: "test")
kate = Homeowner.create(first_name: "Kate", last_name: "Williams", email: "kate@me.org", password: "password")
kate2 = Homeowner.create(first_name: "Kate", last_name: "Alexander", email: "dr.kate@me.org", password: "unicorns")
roy = Homeowner.create(first_name: "Roy", last_name: "Biv", email: "roy@me.org", password: "rainbow")

#Create 5 trees

Tree.create(variety: "Grapefruit", size: "house", fruit_weight: 70, homeowner_id: avi.id)
Tree.create(variety: "Orange", size: "shrub", fruit_weight: 35, homeowner_id: avi.id)
Tree.create(variety: "Myer Lemon", size: "Medium", fruit_weight: 55, homeowner_id: kate.id)
Tree.create(variety: "Calomondin", size: "Tall", fruit_weight: 25, homeowner_id: kate.id)
Tree.create(variety: "Ruby Red Grapefruit", size: "house", fruit_weight: 87.3, homeowner_id: kate2.id)



#Use AR to pre associate data to 5 homeowners:

kate2.tree.create(variety: "Fig", size: "10 ft", fruit_weight: 16)
roy.tree.create(variety: "Kumquat", size: "shrub", fruit_weight: 15)
avi.tree.create(variety: "Lime", size: "15ft", fruit_weight: 35)


roy_tree = roy.tree.build(variety: "Blood Orange", size: "Medium", fruit_weight: 30)
roy_tree.save
kate_tree = kate.tree.create(variety: "Loquat", size: "small", fruit_weight: 18.2)
kate_tree.save