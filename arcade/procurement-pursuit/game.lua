-- Procurement Pursuit: Find the fraud in supplier data
-- Teaches ML anomaly detection from Auditor-Smasher

local ProcurementPursuit = {
    rounds = {
        {
            supplier = "Acme Capital Ltd",
            amount = 500000,
            median_for_category = 25000,
            single_source = true,
            politically_connected = false,
            answer = "HIGH RISK: 20x category median + single source",
            options = {"HIGH RISK", "MEDIUM RISK", "LOW RISK", "CLEAN"},
        },
        {
            supplier = "Shady Offshore Holdings",
            amount = 75000,
            median_for_category = 25000,
            single_source = true,
            politically_connected = true,
            answer = "CRITICAL: Politically connected + single source",
            options = {"CRITICAL", "HIGH RISK", "MEDIUM RISK", "LOW RISK"},
        },
        {
            supplier = "Standard Vendor Ltd",
            amount = 22000,
            median_for_category = 25000,
            single_source = false,
            politically_connected = false,
            answer = "LOW RISK: Below category median",
            options = {"CRITICAL", "HIGH RISK", "MEDIUM RISK", "LOW RISK"},
        },
    },
    score = 0,
}

function ProcurementPursuit.run()
    print("=== PROCUREMENT PURSUIT: Find the Fraud ===\n")
    print("Analyse supplier data. Flag the fraudsters.\n")
    
    for i, round in ipairs(ProcurementPursuit.rounds) do
        print(string.format("Round %d: %s", i, round.supplier))
        print(string.format("  Amount: £%d", round.amount))
        print(string.format("  Category median: £%d", round.median_for_category))
        print(string.format("  Single source: %s", tostring(round.single_source)))
        print(string.format("  Politically connected: %s", tostring(round.politically_connected)))
        print()
        
        print("Options:")
        for j, option in ipairs(round.options) do
            print(string.format("  %d. %s", j, option))
        end
        
        io.write("Your risk assessment (1-4): ")
        local answer = tonumber(io.read())
        
        if answer and round.options[answer] == round.options[1] then  -- First option is always the correct one
            print("  ✓ Correct! Fraud detected!\n")
            ProcurementPursuit.score = ProcurementPursuit.score + 10
        else
            print(string.format("  ✗ The assessment was: %s\n", round.answer))
        end
    end
    
    print(string.format("=== SCORE: %d/30 ===\n", ProcurementPursuit.score))
end

return ProcurementPursuit
