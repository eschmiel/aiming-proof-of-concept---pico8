pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
function _init()
	origin = {30,30}
	target = {80,80}
	vector = get_vector(origin,target)
	calc_target = {
		origin[1]+vector[1],
		origin[2]+vector[2]
		}
	unit_vector = get_unit_vector(vector)

	projectiles={}
end

function _update()
	vector = get_vector(origin,target)
	calc_target = {
		origin[1]+vector[1],
		origin[2]+vector[2]
		}
	unit_vector = get_unit_vector(vector)

	for p in all(projectiles) do
		p:update()
	end	
	if(btnp(4)) mk_projectile()
	
	if(btn(0)) target[1]-=1
	if(btn(1)) target[1]+=1
	if(btn(2)) target[2]-=1
	if(btn(3)) target[2]+=1
end

function _draw()
	cls()
	rectfill(
		origin[1],
		origin[2],
		origin[1],
		origin[2],
		8
	)
	
	rectfill(
		target[1],
		target[2],
	 target[1],
		target[2],
		7
	)
	
	print('origin: '..origin[1]..', '..origin[2],
	 10,70)
	print('target: '..target[1]..', '..target[2],
	 10,80)
	print('vector: '..vector[1]..', '..vector[2],
		10,90
	)
	print('calculated target: '..calc_target[1]..', '..calc_target[2],
	10,100)
	print('unit vector to target: ',
	10,110)
	print(unit_vector[1]..', '..unit_vector[2],
	10,120)

	for p in all(projectiles) do
		p:draw()
	end
end

function get_vector(o,t)
	return {t[1]-o[1],t[2]-o[2]}
end

function get_unit_vector(v)
	magnitude = sqrt(v[1]*v[1] + v[2]*v[2])
	return {v[1]/magnitude, v[2]/magnitude}
end

function mk_projectile()
	local v = get_vector(origin,target)
	local uv = get_unit_vector(v)
	
	add(projectiles,
		{
			speed=2,
			x=origin[1],
			y=origin[2],
			direction=uv,
			update=function(self)
				self.x+=self.direction[1]*self.speed
				self.y+=self.direction[2]*self.speed
			end,
			draw=function(self)
				rectfill(self.x,self.y,self.x,self.y,9)
			end		
		}
	)
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
