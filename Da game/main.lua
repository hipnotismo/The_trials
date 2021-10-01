function checkCollision(a, b)
    --With locals it's common usage to use underscores instead of camelCasing
    local a_left = a.x 
    local a_right = a.x + a.width
    local a_top = a.y - 50
    local a_bottom = a.y + a.height - 50

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y - 50
    local b_bottom = b.y + b.height - 50

    --Directly return this boolean value without using if-statement
    return  a_right > b_left
        and a_left < b_right
        and a_bottom > b_top
        and a_top < b_bottom

end


function love.load()
    --screen control
    screen = 2
    intro = 0
    --variables
    speed = 250
    width = 700
    height = 500
    direction1 = 0

    playerPosX = 10
    playerPosY = 10

    --player 
   player = {
        x = playerPosX,
        y = playerPosY,
        width = 75,
        height = 75
    }

    --enemies
    enemy1 = {
        x = 0,
        y = 100,
        width = 500,
        height = 100
    }
    enemy2 = {
        x = 200,
        y = 300,
        width = 600,
        height = 100
    }
    enemy3 = {
        x = 200,
        y = 400,
        width = 600,
        height = 100
    }
    enemy4 = {
        x = 600,
        y = 200,
        width = 100,
        height = 100
    }
    --goal
    goal1 = {
        x = 700,
        y = 525,
        width = 50,
        height = 50
    }
end

function love.update(dt)

    

    if screen ~= 0 then
        if player.x < width then
            if love.keyboard.isDown("right") then
            player.x = player.x + speed * dt
            end
        end
       
        if player.x > 0 then
         if love.keyboard.isDown("left") then
            player.x = player.x - speed * dt
            end
        end

        if player.y > 0 then
            if love.keyboard.isDown("up") then
            player.y = player.y - speed * dt
            end
        end

        if player.y < height then
            if love.keyboard.isDown("down") then
            player.y = player.y + speed * dt
            end
        end
    end
    if screen == 1 then

        if checkCollision(player, enemy1) then
            player.x = playerPosX
            player.y = playerPosY
        end
        if checkCollision(player, enemy2) then
            player.x = playerPosX
            player.y = playerPosY
        end
        if checkCollision(player, enemy3) then
            player.x = playerPosX
            player.y = playerPosY
        end
        if checkCollision(player, goal1) then
            playerPosX = player.x
            playerPosY = player.y
        end
    end
    if screen == 2 then

        if direction1 == 0 then
            enemy4.x = enemy4.x + speed * dt
            if enemy4.x > 800 then 
                direction1 = 1
                --enemy4.x = enemy4.x - speed * dt

            end
        end

        if direction1 == 1 then
            enemy4.x = enemy4.x - speed * dt
            if enemy4.x < 0 then 
                direction1 = 0
            end
        end
       -- if enemy4.x < 800 and  then
         --   enemy4.x = enemy4.x + speed * dt 
      --  end
        --if enemy4.x > 0 then
          --  enemy4.x = enemy4.x - speed * dt 
       -- end
        print (enemy4.x)
    end
end

function love.draw()
    if screen == 1 then
        love.graphics.setColor(255,100,0)
        love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
      
        love.graphics.setColor(0,255,0)
        love.graphics.rectangle("fill", enemy1.x, enemy1.y, enemy1.width, enemy1.height)
 
        love.graphics.setColor(0,0,255)
        love.graphics.rectangle("fill", enemy2.x, enemy2.y, enemy2.width, enemy2.height)
 
        love.graphics.setColor(0,200,200)
        love.graphics.rectangle("fill", enemy3.x, enemy3.y, enemy3.width, enemy3.height)
      
        love.graphics.setColor(255,0,0)
        love.graphics.rectangle("line", goal1.x, goal1.y, goal1.width, goal1.height)
    end
    
    if screen == 2 then
    love.graphics.setColor(255,100,0)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    
    love.graphics.setColor(0,255,0)
    love.graphics.rectangle("line", enemy4.x, enemy4.y, enemy4.width, enemy4.height)
    
    love.graphics.setColor(0,0,255)
    --love.graphics.rectangle("fill", enemy5.x, enemy5.y, enemy5.width, enemy5.height)
    
    love.graphics.setColor(255,0,0)
   -- love.graphics.rectangle("fill", enemy6.x, enemy6.y, enemy6.width, enemy6.height)
 
    end
end