-- I just stole these from the previous mod, I also removed the duplicate functions they had. 
local function tiny_fuel(inst)
        if not inst.components.fuel then
                inst:AddComponent("fuel")
        end
    inst.components.fuel.fuelvalue = TUNING.TINY_FUEL
end

local function small_fuel(inst)
        if not inst.components.fuel then
                inst:AddComponent("fuel")
        end
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL
end

local function med_fuel(inst)
        if not inst.components.fuel then
                inst:AddComponent("fuel")
        end
    inst.components.fuel.fuelvalue = TUNING.MED_FUEL
end


local function medlarge_fuel(inst)
        if not inst.components.fuel then
                inst:AddComponent("fuel")
        end
    inst.components.fuel.fuelvalue = TUNING.MED_LARGE_FUEL
end


local function large_fuel(inst)
        if not inst.components.fuel then
                inst:AddComponent("fuel")
        end
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
end

local function dark_fuel(inst)
        if not inst.components.fuel then
                inst:AddComponent("fuel")
        end
    inst.components.fuel.fueltype = "NIGHTMARE"
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL
end


-- A table used to define all of the items we want to add as fuel and the preset we wish to apply to them --

new_fuels = { 
    --Golden Tools ---
    ["goldenaxe"] = large_fuel,
    ["goldenpickaxe"] = large_fuel,
    ["goldenshovel"] = large_fuel,

    -- Tools --
    ["umbrella"] = medlarge_fuel,
    ["fishingrod"] = medlarge_fuel,
    ["bugnet"] = medlarge_fuel,
    ["torch"] = medlarge_fuel,
    ["spear"] = medlarge_fuel,
    ["tentaclespike"] = medlarge_fuel,
    ["axe"] = medlarge_fuel,
    ["pickaxe"] = medlarge_fuel,
    ["shovel"] = medlarge_fuel,
    ["pitchfork"] = medlarge_fuel,
    ["hammer"] = medlarge_fuel,

    -- Hats --
    ["spiderhat"] = large_fuel,
    ["bushhat"] = large_fuel,
    ["catcoonhat"] = large_fuel,
    ["tophat"] = large_fuel,
    ["earmuffshat"] = large_fuel,
    ["beefalohat"] = large_fuel,
    ["winterhat"] = large_fuel,
    ["goggleshat"] = large_fuel,
    ["deserthat"] = large_fuel,
    ["strawhat"] = large_fuel,
    ["flowerhat"] = large_fuel,

    -- Seasonal --
    ["winter_food4"] = med_fuel,
    ["wintersfeastfuel"] = medlarge_fuel,

    -- Spook --
    ["petals_evil"] = dark_fuel,
    ["monstermeat"] = dark_fuel,
    ["cookedmonstermeat"] = dark_fuel,
    ["monstermeat_dried"] = dark_fuel,
    ["monsterlasagna"] = dark_fuel,

    -- Misc --
    ["bearger_fur"] = large_fuel,
    ["trap"] = medlarge_fuel,
    ["birdtrap"] = medlarge_fuel,
    ["pigskin"] = medlarge_fuel,
    ["manrabbit_tail"] = medlarge_fuel,
    ["feather_robin_winter"] = med_fuel,
    ["feather_crow"] = med_fuel,
    ["feather_robin"] = med_fuel,
    ["feather_canary"] = med_fuel,
    ["silk"] = small_fuel
}

-- Add all the fuels from the table --
for fuel, ftype in pairs(new_fuels) do
    AddPrefabPostInit(fuel, ftype)
end