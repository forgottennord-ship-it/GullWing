-- Entropy Hunter: Identify packed/obfuscated binaries
-- Teaches the entropy layer from Gullwing's 8-layer analysis

local EntropyHunter = {
    binaries = {
        {
            name = "normal_ls",
            entropy = 5.2,
            packed = false,
            hint = "Normal system binaries have entropy around 5-6 bits/byte",
        },
        {
            name = "packed_malware",
            entropy = 7.8,
            packed = true,
            hint = "Packed binaries often have entropy above 7 bits/byte",
        },
        {
            name = "obfuscated_tool",
            entropy = 7.5,
            packed = true,
            hint = "Encrypted or compressed code pushes entropy higher",
        },
        {
            name = "text_document",
            entropy = 3.1,
            packed = false,
            hint = "Plain text has low entropy — lots of repetition",
        },
    },
    score = 0,
}

function EntropyHunter.start()
    print("=== ENTROPY HUNTER: Find the Packed Binaries ===\n")
    print("Entropy measures randomness. Packed malware hides in high entropy.\n")
end

function EntropyHunter.run()
    EntropyHunter.start()
    
    for i, binary in ipairs(EntropyHunter.binaries) do
        print(string.format("%d. %s (entropy: %.1f)", i, binary.name, binary.entropy))
        io.write("   Packed? (y/n): ")
        local answer = io.read():lower()
        
        local correct = (answer == "y" and binary.packed) or (answer == "n" and not binary.packed)
        
        if correct then
            print("   ✓ Correct!\n")
            EntropyHunter.score = EntropyHunter.score + 10
        else
            print(string.format("   ✗ Wrong. %s\n", binary.hint))
        end
    end
    
    print(string.format("=== SCORE: %d/40 ===\n", EntropyHunter.score))
end

return EntropyHunter
