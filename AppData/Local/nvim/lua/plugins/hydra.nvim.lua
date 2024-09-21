-- todo fetch keys from keys.lua and automate the hydra mappings

return {
    "nvimtools/hydra.nvim",
    config = function()
        local Hydra = require("hydra")
        Hydra({
            -- string? only used in auto-generated hint
            name = "Motion Mode",
            mode = {"n", "x"},
            body = "tc", -- key required to activate the hydra

            foreign_keys = "warn", -- nil/run
            -- invoke_on_body = true, -- invoke as soon as body key typed
            desc = "Motion Mode",
            -- these are explained below
            hint = [[ Motion Mode ]],
            -- config = { ... },
            heads = { 
                {"f", "tf", {desc="Scroll 3 lines up", remap=true}},
                {"s", "ts", {desc="Scroll 3 lines down", remap=true}},
                {":", ":", {exit_before=true}}
            },
        })
    end
}