-- COBOL Quest: Find the bug before the bank crashes
-- Uses the Gullwing-Swan parser to generate puzzles

local COBOLQuest = {
    levels = {
        {
            name = "The Missing Period",
            cobol = [[
       IDENTIFICATION DIVISION.
       PROGRAM-ID. BANKING-APP.
       PROCEDURE DIVISION.
           COMPUTE BALANCE = BALANCE - WITHDRAWAL
           DISPLAY "TRANSACTION COMPLETE"
            ]],
            bug = "Missing period after WITHDRAWAL",
            hint = "COBOL statements end with a period. Look carefully.",
        },
        {
            name = "The GOTO Trap",
            cobol = [[
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PAYROLL.
       PROCEDURE DIVISION.
           IF SALARY > 10000 THEN
               GOTO BONUS
           ELSE
               DISPLAY "STANDARD PAY"
           END-IF.
           BONUS.
           DISPLAY "MASSIVE BONUS"
            ]],
            bug = "GOTO bypasses the IF/ELSE logic",
            hint = "Follow the control flow. Where does the code jump?",
        },
        {
            name = "The Division Disaster",
            cobol = [[
       IDENTIFICATION DIVISION.
       PROGRAM-ID. MORTGAGE.
       PROCEDURE DIVISION.
           COMPUTE PAYMENT = LOAN / 0
           DISPLAY "PAYMENT CALCULATED"
            ]],
            bug = "Division by zero",
            hint = "What happens when you divide by zero?",
        },
    },
    score = 0,
    level_index = 1,
}

function COBOLQuest.start()
    print("=== COBOL QUEST: Find the Bug Before the Bank Crashes ===\n")
    print("3 levels. 3 bugs. 3 chances to save the financial system.\n")
end

function COBOLQuest.play_level(level)
    print(string.format("━━━ Level %d: %s ━━━", COBOLQuest.level_index, level.name))
    print()
    print("COBOL code:")
    print(level.cobol)
    print()
    print("What's the bug?")
    print(string.format("  Hint: %s", level.hint))
    print()
    
    io.write("Your answer: ")
    local answer = io.read()
    
    if answer and answer:lower():find(level.bug:lower(), 1, true) then
        print("  ✓ CORRECT! Bug found!\n")
        COBOLQuest.score = COBOLQuest.score + 10
        return true
    else
        print(string.format("  ✗ The bug was: %s\n", level.bug))
        return false
    end
end

function COBOLQuest.run()
    COBOLQuest.start()
    
    for _, level in ipairs(COBOLQuest.levels) do
        COBOLQuest.play_level(level)
        COBOLQuest.level_index = COBOLQuest.level_index + 1
    end
    
    print(string.format("=== GAME OVER ===\nScore: %d/30", COBOLQuest.score))
    if COBOLQuest.score == 30 then
        print("PERFECT! You saved the banking system!\n")
    elseif COBOLQuest.score >= 20 then
        print("Good job! The banks are mostly safe.\n")
    else
        print("The COBOL bugs remain. The banks are at risk!\n")
    end
end

return COBOLQuest
