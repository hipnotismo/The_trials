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
    direction2 = 0
    direction3 = 0
    
    direction4 = 0
    direction5 = 0
    direction6 = 0
    
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
        x = 0,
        y = 100,
        width = 100,
        height = 100
    }
    enemy5 = {
        x = 350,
        y = 200,
        width = 100,
        height = 100
    }
    enemy6 = {
        x = 0,
        y = 300,
        width = 100,
        height = 100
    }
    enemy7 = {
        x = 350,
        y = 100,
        width = 100,
        height = 100
    }
    enemy8 = {
        x = 700,
        y = 200,
        width = 100,
        height = 100
    }
    enemy9 = {
        x = 350,
        y = 300,
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
    goal2 = {
        x = 10,
        y = 10,
        width = 50,
        height = 50
    }
end

function love.update(dt)

    
--preventing movement of player in menu
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

--collisions of player and enemy level 1
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
--collision with goal
        if checkCollision(player, goal1) then
            playerPosX = player.x
            playerPosY = player.y
        end
    end
--level 2

    if screen == 2 then
--movement of the enemies
--left side
        if direction1 == 0 then
            enemy4.x = enemy4.x + speed * dt
            if enemy4.x > 350 then 
                direction1 = 1
            end
        end
        if direction1 == 1 then
            enemy4.x = enemy4.x - speed * dt
            if enemy4.x < 0 then 
                direction1 = 0
            end
        end
        --
        if direction2 == 0 then
            enemy5.x = enemy5.x + speed * dt
            if enemy5.x > 350 then 
                direction2 = 1
            end
        end
        if direction2 == 1 then
            enemy5.x = enemy5.x - speed * dt
            if enemy5.x < 0 then 
                direction2 = 0
            end
        end
        --
        if direction3 == 0 then
            enemy6.x = enemy6.x + speed * dt
            if enemy6.x > 350 then 
                direction3 = 1
            end
        end
        if direction3 == 1 then
            enemy6.x = enemy6.x - speed * dt
            if enemy6.x < 0 then 
                direction3 = 0
            end
        end
--right side
         --
        if direction4 == 0 then
            enemy7.x = enemy7.x + speed * dt
            if enemy7.x > 800 then 
                direction4 = 1
            end
        end
        if direction4 == 1 then
            enemy7.x = enemy7.x - speed * dt
            if enemy7.x < 350 then 
                direction4 = 0
            end
        end
        --
        if direction5 == 0 then
            enemy8.x = enemy8.x + speed * dt
            if enemy8.x > 800 then 
                direction5 = 1
            end
        end
        if direction5 == 1 then
            enemy8.x = enemy8.x - speed * dt
            if enemy8.x < 350 then 
                direction5 = 0
            end
        end
        --
        if direction6 == 0 then
            enemy9.x = enemy9.x + speed * dt
            if enemy9.x > 800 then 
                direction6 = 1
            end
        end
        if direction6 == 1 then
            enemy9.x = enemy9.x - speed * dt
            if enemy9.x < 350 then 
                direction6 = 0
            end
        end
        --
--player collision level 2
       if checkCollision(player, enemy4) then
            player.x = playerPosX
            player.y = playerPosY
        end
        if checkCollision(player, enemy5) then
            player.x = playerPosX
            player.y = playerPosY
        end
        if checkCollision(player, enemy6) then
            player.x = playerPosX
            player.y = playerPosY
        end
        if checkCollision(player, enemy7) then
            player.x = playerPosX
            player.y = playerPosY
        end
        if checkCollision(player, enemy8) then
            player.x = playerPosX
            player.y = playerPosY
        end
        if checkCollision(player, enemy9) then
            player.x = playerPosX
            player.y = playerPosY
        end
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
        love.graphics.rectangle("fill", goal1.x, goal1.y, goal1.width, goal1.height)
    end
    
    if screen == 2 then
    love.graphics.setColor(255,100,0)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    
    love.graphics.setColor(0,255,0)
    love.graphics.rectangle("fill", enemy4.x, enemy4.y, enemy4.width, enemy4.height)
    
    love.graphics.setColor(0,0,255)
    love.graphics.rectangle("fill", enemy5.x, enemy5.y, enemy5.width, enemy5.height)
    
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", enemy6.x, enemy6.y, enemy6.width, enemy6.height)
 
    love.graphics.setColor(0,255,0)
    love.graphics.rectangle("fill", enemy7.x, enemy7.y, enemy7.width, enemy7.height)
    
    love.graphics.setColor(0,0,255)
    love.graphics.rectangle("fill", enemy8.x, enemy8.y, enemy8.width, enemy8.height)
    
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", enemy9.x, enemy9.y, enemy9.width, enemy9.height)
 
    love.graphics.setColor(255,0,0)
    love.graphics.rectangle("fill", goal2.x, goal2.y, goal2.width, goal2.height)
   
    end
end