-- Fuel Sizes
-- They just return a preset number used by the vanilla items.

-- For some reason instead of adding another size tier, they've been multiplying the large tier for things like glow berries. 
-- See scripts/prefabs/wormlight.lua:127
xlarge    = TUNING.LARGE_FUEL * 1.33
large     = TUNING.LARGE_FUEL
medium    = TUNING.MED_FUEL
medlarge  = TUNING.MED_LARGE_FUEL
small     = TUNING.SMALL_FUEL
tiny      = TUNING.TINY_FUEL


-- Types of fuel
normal    = "BURNABLE"
nightmare = "NIGHTMARE"
moggles   = "WORMLIGHT"
cold      = "CHEMICAL"
lantern   = "CAVE"
why       = "ONEMANBAND"


-- A table used to define all of the items we want to add as fuel and the presets we wish to apply to them 

new_fuels = { 
    --Golden Tools ---
    ["goldenaxe"]            = { ["ftype"] = normal, ["fsize"] = large },
    ["goldenpickaxe"]        = { ["ftype"] = normal, ["fsize"] = large },
    ["goldenshovel"]         = { ["ftype"] = normal, ["fsize"] = large },
    
    -- Tools --
    ["umbrella"]             = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["fishingrod"]           = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["bugnet"]               = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["torch"]                = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["spear"]                = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["tentaclespike"]        = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["axe"]                  = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["pickaxe"]              = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["shovel"]               = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["pitchfork"]            = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["hammer"]               = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["firestaff"]            = { ["ftype"] = normal, ["fsize"] = large},
    ["icestaff"]             = { ["ftype"] = normal, ["fsize"] = large},
    ["telestaff"]            = { ["ftype"] = normal, ["fsize"] = large},

    -- Hats --
    ["spiderhat"]            = { ["ftype"] = normal, ["fsize"] = large },
    ["bushhat"]              = { ["ftype"] = normal, ["fsize"] = large },
    ["catcoonhat"]           = { ["ftype"] = normal, ["fsize"] = large },
    ["tophat"]               = { ["ftype"] = normal, ["fsize"] = large },
    ["earmuffshat"]          = { ["ftype"] = normal, ["fsize"] = large },
    ["beefalohat"]           = { ["ftype"] = normal, ["fsize"] = large },
    ["winterhat"]            = { ["ftype"] = normal, ["fsize"] = large },
    ["goggleshat"]           = { ["ftype"] = normal, ["fsize"] = large },
    ["deserthat"]            = { ["ftype"] = normal, ["fsize"] = large },
    ["strawhat"]             = { ["ftype"] = normal, ["fsize"] = large },
    ["flowerhat"]            = { ["ftype"] = normal, ["fsize"] = large },
    ["walrushat"]            = { ["ftype"] = normal, ["fsize"] = large },

    -- Seasonal --
    ["winter_food4"]         = { ["ftype"] = normal, ["fsize"] = medium }, --Fruit Cake
    ["wintersfeastfuel"]     = { ["ftype"] = normal, ["fsize"] = medlarge }, -- Holiday Cheer

    -- Spook --
    ["petals_evil"]          = { ["ftype"] = nightmare, ["fsize"] = medium },
    ["monstermeat"]          = { ["ftype"] = nightmare, ["fsize"] = medium },
    ["cookedmonstermeat"]    = { ["ftype"] = nightmare, ["fsize"] = medium },
    ["monstermeat_dried"]    = { ["ftype"] = nightmare, ["fsize"] = medium },
    ["monsterlasagna"]       = { ["ftype"] = nightmare, ["fsize"] = large },
    ["ghostflower"]          = { ["ftype"] = nightmare, ["fsize"] = xlarge},

    -- Misc --
    ["bearger_fur"]          = { ["ftype"] = normal, ["fsize"] = large },
    ["slurper_pelt"]         = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["trap"]                 = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["birdtrap"]             = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["pigskin"]              = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["manrabbit_tail"]       = { ["ftype"] = normal, ["fsize"] = medlarge },
    ["feather_robin_winter"] = { ["ftype"] = normal, ["fsize"] = medium },
    ["feather_crow"]         = { ["ftype"] = normal, ["fsize"] = medium },
    ["feather_robin"]        = { ["ftype"] = normal, ["fsize"] = medium },
    ["feather_canary"]       = { ["ftype"] = normal, ["fsize"] = medium },
    ["silk"]                 = { ["ftype"] = normal, ["fsize"] = small },
    ["lavae_cocoon"]         = { ["ftype"] = normal, ["fsize"] = large},
    ["lavae_egg"]            = { ["ftype"] = normal, ["fsize"] = large},
    ["moon_tree_blossom"]    = { ["ftype"] = lantern, ["fsize"] = xlarge },
    ["moonbutterflywings"]   = { ["ftype"] = lantern, ["fsize"] = large},
    ["mole"]                 = { ["ftype"] = moggles, ["fsize"] = xlarge },
}

-- Single function that just uses the tables to tweak the instances.
local function AddFuel(inst)
        if not inst.components.fuel then
                inst:AddComponent("fuel")
        end
    inst.components.fuel.fueltype = new_fuels[inst.prefab]["ftype"]
    inst.components.fuel.fuelvalue = new_fuels[inst.prefab]["fsize"]
end

-- Add all the fuels from the table
for fuel, fdata in pairs(new_fuels) do
        AddPrefabPostInit(fuel, AddFuel)
end