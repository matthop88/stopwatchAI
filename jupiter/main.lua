-- Stopwatch Application - WATCH-001
-- Timer that counts up at 1 second per second

local WINDOW_WIDTH = 300
local WINDOW_HEIGHT = 400
local COLOR_SALMON = {0.8, 0.5, 0.5}

local elapsedTime = 0  -- Time in seconds
local TIME_FONT

function love.load()
    -- Set window properties
    love.window.setTitle("STOPWATCH!!!")
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
    
    -- Create TIME_FONT for the timer display
    TIME_FONT = love.graphics.newFont(64)
    love.graphics.setFont(TIME_FONT)
end

function love.update(dt)
    -- Update elapsed time (dt is delta time in seconds)
    elapsedTime = elapsedTime + dt
end

function drawBackground()
    love.graphics.clear(COLOR_SALMON)
end

function getTimeTextMMSS()
    -- Calculate minutes and seconds
    local totalSeconds = math.floor(elapsedTime)
    local minutes = math.floor(totalSeconds / 60)
    local seconds = totalSeconds % 60
    
    -- Format time as "MM:SS"
    return string.format("%02d:%02d", minutes, seconds)
end

function love.draw()
    drawBackground()
    
    local timeText = getTimeTextMMSS()
    
    -- Set white text color
    love.graphics.setColor(1, 1, 1)
    
    -- Get text dimensions for centering
    local textWidth = TIME_FONT:getWidth(timeText)
    local textHeight = TIME_FONT:getHeight()
    
    -- Calculate centered position
    local x = (WINDOW_WIDTH - textWidth) / 2
    local y = (WINDOW_HEIGHT - textHeight) / 2
    
    -- Draw the time text centered
    love.graphics.print(timeText, x, y)
end
