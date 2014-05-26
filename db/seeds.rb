# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

b1 = Badge.create :name => 'Artistic Integrity', :requirements => 'See all of the art structures on campus'
b2 = Badge.create :name => 'Outdoorsperson', :requirements => 'Visit all of the outdoor sights on and around campus'
b3 = Badge.create :name => 'Gotta Geocache Them All', :requirements => 'Find all the geocaches on campus'


u1 = User.create :name => 'Sean B', :logged_in => false, :badges => [b1, b2]
u2 = User.create :name => 'Hannah C', :logged_in => false
u3 = User.create :name => 'Bonnie Q', :logged_in => false
u4 = User.create :name => 'Charlie C', :logged_in => false
u5 = User.create :name => 'Yanli W', :logged_in => false
u6 = User.create :name => 'Ozzie T', :logged_in => false
u7 = User.create :name => 'Nico P', :logged_in => false

outdoors = Category.create :description => 'Outdoors'
art = Category.create :description => 'Art'
activity = Category.create :description => 'Activity'

a1 = Activity.create :name => 'Sun God', :description => 'Sun God statue', :loc_x => 0.0 , :loc_y => 0.0, :category => art, :user => u1
a2 = Activity.create :name => 'Snake Path', :description => 'A windy path in the design of a snake leading to Giesel from Warren', :loc_x => 0.0 , :loc_y => 0.0, :category => art, :user => u2
a3 = Activity.create :name => 'Black\'s Beach', :description => 'A beach near campus. Some areas clothing optional', :loc_x => 0.0 , :loc_y => 0.0, :category => outdoors, :user => u3
a4 = Activity.create :name => 'Fallen Star', :description => 'A house on top of EBU1', :loc_x => 0.0 , :loc_y => 0.0, :category => art, :user => u4
a5 = Activity.create :name => 'Geocache', :description => 'Geocaches near UCSD', :loc_x => 0.0 , :loc_y => 0.0, :category => outdoors, :user => u5
a6 = Activity.create :name => 'Giraffe Net', :description => '', :loc_x => 0.0 , :loc_y => 0.0, :category => art, :user => u6
a7 = Activity.create :name => 'Dr. Seuss statue', :description => 'Dr. Seuss and the Cat in the Hat near Giesel', :loc_x => 0.0 , :loc_y => 0.0, :category => art, :user => u7
a8 = Activity.create :name => 'Trails', :description => 'Official campus trails', :loc_x => 0.0 , :loc_y => 0.0, :category => activity, :user => u1

c1 = Comment.create :content => 'Don\'t poop under the Sun God troll. Downvoting', :user => u1, :activity => a1
c2 = Comment.create :content => 'Snake path is a real thing, leads to Geisel coming from Warren mall.', :user => u2, :activity => a2
c3 = Comment.create :content => 'Lots of geocaches around campus', :user => u3, :activity => a5
c4 = Comment.create :content => 'Fallen Star on top of EBU1 in Warren, check for visiting hours online', :user => u4, :activity => a4
c6 = Comment.create :content => 'wtf if the giraffe net???', :user => u5, :activity => a6
c7 = Comment.create :content => 'the big blue useless net thing walking from library walk towards mandeville', :user => u6, :activity => a6
c8 = Comment.create :content => 'oooh that thing. is it to catch the trees from falling?', :user => u5, :activity => a6
c9 = Comment.create :content => 'no..its art. apparently the top of the net is level while the posts spans different heights, therefore art', :user => u6, :activity => a6
c10 = Comment.create :content => 'o really? i dont get it. are you sure?', :user => u5, :activity => a6
c11 = Comment.create :content => 'no, someone told me that and i decided to believe them', :user => u6, :activity => a6
c12 = Comment.create :content => 'kk ty', :user => u5, :activity => a6
c13 = Comment.create :content => 'How many trails?', :user => u7, :activity => a8
c14 = Comment.create :content => 'here are the trails http://blink.ucsd.edu/HR/services/support/health/walk/maps.html', :user => u1, :activity => a8
c15 = Comment.create :content => 'thanks +1', :user => u7, :activity => a8
c16 = Comment.create :content => 'Are there naked people at blacks beach?', :user => u7, :activity => a3
c17 = Comment.create :content => 'There is a portion of the beach that is clothing optional.', :user => u4, :activity => a3
c18 = Comment.create :content => 'Abandon all hope, ye who enter here', :user => u5, :activity => a3
c19 = Comment.create :content => '+1', :user => u6, :activity => a3


v1 = Vote.create :score => 1, :user => u1, :activity => a1
v2 = Vote.create :score => 1, :user => u2, :activity => a1
v3 = Vote.create :score => 1, :user => u3, :activity => a1
v4 = Vote.create :score => 1, :user => u4, :activity => a1
v5 = Vote.create :score => -1, :user => u5, :activity => a1
v6 = Vote.create :score => -1, :user => u6, :activity => a1
v7 = Vote.create :score => -1, :user => u7, :activity => a1
v8 = Vote.create :score => 1, :user => u1, :activity => a2
v9 = Vote.create :score => 1, :user => u2, :activity => a2
v10 = Vote.create :score => 1, :user => u3, :activity => a2
v12 = Vote.create :score => 1, :user => u4, :activity => a2
v13 = Vote.create :score => -1, :user => u5, :activity => a2
v14 = Vote.create :score => -1, :user => u6, :activity => a2
v15 = Vote.create :score => -1, :user => u7, :activity => a2








