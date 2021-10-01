function love.load()
    --screen control
    screen = 1
    --variables
    speed = 500
    width = 700
    height = 500

    playerPosX = 10
    playerPosY = 100

    --player 
   player = {
        x = playerPosX,
        y = playerPosY,
        width = 100,
        height = 100
    }

    --enemies
    enemy1 = {
        x = 10,
        y = 100,
        width = 100,
        height = 100
    }

   
end

function love.update(dt)
    if screen == 1 then
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
        print(player.y)

        
    end
end

function love.draw()
    if screen == 1 then
        love.graphics.setColor(255,0,0)
        love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
        love.graphics.setColor(0,255,0)
        love.graphics.rectangle("line", enemy1.x, enemy1.y, enemy1.width, enemy1.height)
    end
end