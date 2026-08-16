-- Fleet Commander: Manage a Headscale mesh network
-- Teaches distributed verification from PartyVault

local FleetCommander = {
    nodes = {
        {name = "Clearstream", status = "ONLINE", verifications = 150},
        {name = "Euroclear", status = "ONLINE", verifications = 200},
        {name = "BNY Mellon", status = "DEGRADED", verifications = 75},
        {name = "Unknown Node", status = "SUSPICIOUS", verifications = 5},
    },
    score = 0,
}

function FleetCommander.run()
    print("=== FLEET COMMANDER: Manage the Verification Mesh ===\n")
    print("Monitor the fleet. Identify the suspicious node.\n")
    
    for i, node in ipairs(FleetCommander.nodes) do
        print(string.format("%d. %s", i, node.name))
        print(string.format("   Status: %s", node.status))
        print(string.format("   Verifications: %d", node.verifications))
        print()
    end
    
    print("Which node is suspicious?")
    io.write("Your answer (1-4): ")
    local answer = tonumber(io.read())
    
    if answer == 4 then
        print("  ✓ Correct! Unknown Node is the intruder!\n")
        FleetCommander.score = 30
    else
        print("  ✗ The suspicious node was #4: Unknown Node\n")
    end
    
    print(string.format("=== SCORE: %d/30 ===\n", FleetCommander.score))
end

return FleetCommander
