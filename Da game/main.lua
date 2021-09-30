function love.load()
    --player 
    playerX = 10
    playerY = 10
    playerWith = 50
    playerHight = 50
    --enemies
    enemy1X = 100
    enemy1Y = 100
    enemy1With =100
    enemy1Hight = 100
end

function love.update(dt)
    if love.keyboard.isDown("right") then
    playerX = playerX + 100 * dt
end
end

function love.draw()
    love.graphics.rectangle("line", playerX, playerY, playerWith, playerHight)
    love.graphics.rectangle("line", enemy1X, enemy1Y, enemy1With, enemy1Hight)

end