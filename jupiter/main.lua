-- Stopwatch Application - WATCH-001
-- Timer that counts up at 1 second per second

local WINDOW_WIDTH = 300
local WINDOW_HEIGHT = 400

local elapsedTime = 0  -- Time in seconds
local font

function love.conf(t)
    t.window.title = "STOPWATCH!!!"
    t.window.width = WINDOW_WIDTH
    t.window.height = WINDOW_HEIGHT
end

function love.load()
    -- Create font for the timer display
    font = love.graphics.newFont(64)
    love.graphics.setFont(font)
end

function love.update(dt)
    -- Update elapsed time (dt is delta time in seconds)
    elapsedTime = elapsedTime + dt
end

function love.draw()
    -- Set salmon background color (r = 0.8, g = 0.5, b = 0.5)
    love.graphics.clear(0.8, 0.5, 0.5)
    
    -- Calculate minutes and seconds
    local totalSeconds = math.floor(elapsedTime)
    local minutes = math.floor(totalSeconds / 60)
    local seconds = totalSeconds % 60
    
    -- Format time as "MM:SS"
    local timeText = string.format("%02d:%02d", minutes, seconds)
    
    -- Set white text color
    love.graphics.setColor(1, 1, 1)
    
    -- Get text dimensions for centering
    local textWidth = font:getWidth(timeText)
    local textHeight = font:getHeight()
    
    -- Calculate centered position
    local x = (WINDOW_WIDTH - textWidth) / 2
    local y = (WINDOW_HEIGHT - textHeight) / 2
    
    -- Draw the time text centered
    love.graphics.print(timeText, x, y)
end
