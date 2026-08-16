-- Binary Detective: Identify the binary from 8-layer clues
-- Teaches the full convergent analysis

local BinaryDetective = {
    cases = {
        {
            clues = {
                "ELF: true",
                "Class: ELF64",
                "Libraries: libc.so.6",
                "Entropy: 5.2",
                "ML: system_utility",
            },
            answer = "Standard Linux system utility",
            options = {"Linux system utility", "Windows malware", "Android app", "Firmware image"},
        },
        {
            clues = {
                "ELF: false",
                "PE: true",
                "Entropy: 7.8",
                "ML: suspicious",
                "Imports: kernel32.dll, ws2_32.dll",
            },
            answer = "Packed Windows executable",
            options = {"Packed Windows executable", "Linux daemon", "Database file", "Image file"},
        },
        {
            clues = {
                "ELF: true",
                "Class: ELF32",
                "Architecture: ARM",
                "Entropy: 6.1",
                "ML: embedded",
            },
            answer = "Embedded ARM firmware",
            options = {"Embedded ARM firmware", "x86 desktop app", "Script file", "Archive"},
        },
    },
    score = 0,
}

function BinaryDetective.run()
    print("=== BINARY DETECTIVE: Identify the File from Clues ===\n")
    
    for i, case in ipairs(BinaryDetective.cases) do
        print(string.format("Case %d:", i))
        for _, clue in ipairs(case.clues) do
            print(string.format("  • %s", clue))
        end
        print()
        
        print("Options:")
        for j, option in ipairs(case.options) do
            print(string.format("  %d. %s", j, option))
        end
        
        io.write("Your answer (1-4): ")
        local answer = tonumber(io.read())
        
        if answer and case.options[answer] == case.answer then
            print("  ✓ Correct!\n")
            BinaryDetective.score = BinaryDetective.score + 10
        else
            print(string.format("  ✗ The answer was: %s\n", case.answer))
        end
    end
    
    print(string.format("=== SCORE: %d/30 ===\n", BinaryDetective.score))
end

return BinaryDetective
