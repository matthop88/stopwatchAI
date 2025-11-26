-- Stopwatch Application - WATCH-001
-- Timer that counts up at 1 second per second

local WINDOW_WIDTH = 300
local WINDOW_HEIGHT = 400
local COLOR_SALMON = {0.8, 0.5, 0.5}
local COLOR_WHITE = {1, 1, 1}

local elapsedTime = 0  -- Time in seconds
local TIME_FONT

function love.load()
    setWindowProperties()
    createTimeFont()
end

function love.draw()
    drawBackground()
    drawTimeText()
end

function love.update(dt)
    -- Update elapsed time (dt is delta time in seconds)
    elapsedTime = elapsedTime + dt
end

function setWindowProperties()
    love.window.setTitle("STOPWATCH!!!")
    love.window.setMode(WINDOW_WIDTH, WINDOW_HEIGHT)
end

function createTimeFont()
    TIME_FONT = love.graphics.newFont(64)
    love.graphics.setFont(TIME_FONT)
end

function drawBackground()
    love.graphics.clear(COLOR_SALMON)
end

function drawTimeText()
    local timeText = getTimeTextMMSS()
    
    local textWidth = TIME_FONT:getWidth(timeText)
    local textHeight = TIME_FONT:getHeight()
    
    local centeredX = (WINDOW_WIDTH - textWidth) / 2
    local centeredY = (WINDOW_HEIGHT - textHeight) / 2
    
    love.graphics.setColor(COLOR_WHITE)
    love.graphics.print(timeText, centeredX, centeredY)
end

function getTimeTextMMSS()
    local totalSeconds = math.floor(elapsedTime)
    local minutes = math.floor(totalSeconds / 60)
    local seconds = totalSeconds % 60
    
    return string.format("%02d:%02d", minutes, seconds)
end
