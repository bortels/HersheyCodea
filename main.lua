LOVECODIFYHUD = false
if dofile ~= nil then
   dofile("loveCodify.lua")
   dofile("HersheyCodea/romansimplex.lua")
end

-- Just a "Main" tab for Codea to demo the class
-- DON'T PANIC!
-- You don't need any of this - all of the Font is in the class.
-- This is just a few examples to show you how you might call it.

function setup()
   -- instantiate the font; this is the only "required" line. 
   f=HersheyRomanSimplex()
   -- initialize some variables for the demos in draw()
   frame=1
   offset = 0
   stroke_width=2
   iparameter("stroke_width", 1, 5, stroke_width)
   speed=2
   parameter("speed", 0, 8, speed)
   x=50
   text = "  Why do you necessarily have to be wrong just because "
       .. "a few million people think you are?  "
   bannerscale= 2
   parameter("bannerscale", 0, 10, bannerscale)
   bannerlength = f:stringwidth(text, bannerscale)
   spintxt = "Bananas!"
   spinscale = 1.5
   spinwidth = f:stringwidth(spintxt, spinscale)
   rf = 0.03 -- rainbow frequency
   lab = f:addlabel("Don't Panic!", 100, 400, 1, 45, { 255, 255, 0, 255 })
   lab2 = f:addlabel{ txt="BULLY FOR YOU", x=10, y=700, size=1, rot=-45, color={0, 255, 255, 255} }
   -- setup for particle fountain
   grav=0.7
   yimpulse=25
   ximpulse=20
   local p, i = 300
   for i=1, p do
      local t = f:addlabel(string.char(33+math.random(92)), math.random(WIDTH), math.random(HEIGHT), 1, 0,
                { math.random(128)+127, math.random(128)+127, math.random(128)+127, 255} )
      t.yv = math.random(yimpulse)
      t.xv = math.random(ximpulse)-ximpulse/2
      t.rv = (math.random() - 0.5) / 10
   end                    
end

function draw()
   background(0, 0, 0, 255) -- clear screen
   frame = frame + 1 -- used by lots of things
   stroke(226, 235, 234, 255)
   noSmooth()
   strokeWidth(stroke_width)
   lineCapMode(ROUND)
   
   -- simple text printing
   f:drawstring("Hershey Roman Simplex " .. frame, 150, 200)
   
   -- smooth scroll
   stroke(140, 147, 215, 255)
   local bl = f:drawstring(text .. text ,
                           x - offset, HEIGHT/2,
                           bannerscale) /2
   offset = offset + speed
   if (offset > bl) then offset = 0 end

   -- changing size
   fps = string.format("%.2f", frame / ElapsedTime)
   f:drawstring(fps .. " fps", 500, 600, math.sin(frame / 94))

   -- rainbow!
   stroke(math.sin(rf*frame)*127 + 128,
          math.sin(rf*frame + 2)*127 + 128,
          math.sin(rf*frame + 4)*127 + 128, 255)
    f:drawstring("Daddy loves Gracie and Maddy", 200, 20)
    
   -- spinner (using external positioning)
   pushMatrix()
   translate(200, 550)
   rotate(frame*2.5)
   translate(0-spinwidth/2, -10)
   stroke(255, 252, 0, 255)
   f:drawstring(spintxt, 0, 0, spinscale)
   popMatrix()

   -- label
   lab.x = math.sin(frame/300) * (WIDTH/3) + WIDTH/2
   lab.y = math.cos(frame/300) * (HEIGHT/3) + HEIGHT/2
   lab.rot = math.sin(frame/300) * 5
   lab.color = { 255, 40, 40, math.sin(frame/3) * 100 + 155 }
   f:draw()
      for i=1, # f.labels do
      local t = f.labels[i]
      if (t.xv) then -- only if it's a particle
         t.x = t.x + t.xv
         t.y = t.y + t.yv
         t.yv = t.yv - grav
         t.rot = t.rot + t.rv
         if (t.y < -20) then -- offscreen
            t.yv = math.random(yimpulse)
            t.xv = math.random(ximpulse)-ximpulse/2
            t.x = WIDTH/2
            t.y = HEIGHT/2
         end
      end
   end
end
