-- Add a light entity when an electric pole is built
local function AddLight(pole)
    pole.surface.create_entity{
        name = "pole-lamp",
        position = pole.position,
        force = pole.force
    }
end

-- Remove all light entities within the bounding box of an entity
local function RemoveLight(pole)
    local lights = pole.surface.find_entities_filtered{
        area = pole.bounding_box,
        name = "pole-lamp"
    }
    for _, light in pairs(lights) do
        light.destroy()
    end
end

-- Filter for electric poles
local filter = {{filter = "type", type = "electric-pole"}}

-- Event handlers
script.on_event(defines.events.on_built_entity, function(event) AddLight(event.created_entity) end, filter)
script.on_event(defines.events.on_robot_built_entity, function(event) AddLight(event.created_entity) end, filter)
script.on_event(defines.events.script_raised_built, function(event) AddLight(event.entity) end, filter)
script.on_event(defines.events.script_raised_revive, function(event) AddLight(event.entity) end, filter)

script.on_event(defines.events.script_raised_destroy, function(event) RemoveLight(event.entity) end, filter)
script.on_event(defines.events.on_player_mined_entity, function(event) RemoveLight(event.entity) end, filter)
script.on_event(defines.events.on_robot_mined_entity, function(event) RemoveLight(event.entity) end, filter)
script.on_event(defines.events.on_entity_died, function(event) RemoveLight(event.entity) end, filter)