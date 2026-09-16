-- example of collision detection between two sprites
-- returns true if sprites are colliding
-- assumes both sprites have x and y properties
-- note: you may wish to use a variable for sprite size
-- rather than hard-coding a width/height of 8
function collide(a,b)

 local a_left=a.x
 local a_top=a.y
 local a_right=a.x+7
 local a_bottom=a.y+7

 local b_left=b.x
 local b_top=b.y
 local b_right=b.x+7
 local b_bottom=b.y+7

 if (a_top>b_bottom) return false
 if (b_top>a_bottom) return false
 if (a_left>b_right) return false
 if (b_left>a_right) return false

 return true
end
