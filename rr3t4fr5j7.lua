-- // Menu Principal
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/UI-Library/main.lua"))()
local Window = Library.CreateLib("TFNHX", "DarkTheme")

-- // Escolher Time
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
LocalPlayer.Team = game.Teams["Pirates"]

-- // Abas (Tabs)
local AutoFarmTab = Window:NewTab("Auto Farm")
local AutoRaidTab = Window:NewTab("Auto Raid")
local SeaEventTab = Window:NewTab("Eventos do Mar")
local MoneyFragmentTab = Window:NewTab("Farm de Dinheiro & Fragmentos")
local BossHuntTab = Window:NewTab("Foco de Boss & Espadas")
local EliteMissionTab = Window:NewTab("Missões de Elite")
local AutoSpinTab = Window:NewTab("Auto Giro de Frutas")
local AutoFruitTab = Window:NewTab("Auto Coleta de Frutas")
local AutoItemTab = Window:NewTab("Auto Coleta de Itens")
local HakiTab = Window:NewTab("Auto Evolução de Haki")
local AuraTab = Window:NewTab("Todas as Cores de Aura")
local RaceEvolutionTab = Window:NewTab("Auto Evolução de Raças")
local MasteryHitKillTab = Window:NewTab("Auto Maestria & Hit Kill")

-- // Seções dentro das Abas
local AutoFarmSection = AutoFarmTab:NewSection("Farm de Level & Missões")
local AutoRaidSection = AutoRaidTab:NewSection("Completar Raids")
local SeaEventSection = SeaEventTab:NewSection("Farm de Sea Beasts e Baús")
local MoneyFragmentSection = MoneyFragmentTab:NewSection("Farm de Dinheiro & Fragmentos")
local BossHuntSection = BossHuntTab:NewSection("Farm de Bosses & Espadas")
local EliteMissionSection = EliteMissionTab:NewSection("Farm de Missões de Elite")
local AutoSpinSection = AutoSpinTab:NewSection("Auto Giro de Frutas")
local AutoFruitSection = AutoFruitTab:NewSection("Auto Coleta e Armazenamento de Frutas")
local AutoItemSection = AutoItemTab:NewSection("Auto Coleta de Espadas, Itens & Acessórios")
local HakiSection = HakiTab:NewSection("Auto Evolução do Haki da Observação")
local AuraSection = AuraTab:NewSection("Todas as Cores de Aura")
local RaceEvolutionSection = RaceEvolutionTab:NewSection("Auto Evolução de Raças")
local MasterySection = MasteryHitKillTab:NewSection("Auto Maestria de Espadas, Armas e Estilos de Luta")
local HitKillSection = MasteryHitKillTab:NewSection("Hit Kill")

-- // Auto Evolução do Haki da Observação
HakiSection:NewToggle("Auto Evoluir Haki", "Treina e evolui automaticamente o Haki da Observação", function(state)
    if state then
        while true do
            wait(1)
            game.ReplicatedStorage.Remotes.TrainHaki:FireServer()
        end
    end
end)

-- // Todas as Cores de Aura
AuraSection:NewButton("Desbloquear Todas as Cores", "Desbloqueia todas as cores de aura disponíveis", function()
    game.ReplicatedStorage.Remotes.UnlockAuraColors:FireServer()
end)

-- // Auto Evolução de Raças
RaceEvolutionSection:NewToggle("Auto Evoluir Raça", "Completa requisitos para evoluir raça automaticamente", function(state)
    if state then
        while true do
            wait(1)
            game.ReplicatedStorage.Remotes.EvolveRace:FireServer()
        end
    end
end)

-- // Auto Coleta de Espadas, Itens e Acessórios
AutoItemSection:NewToggle("Auto Coletar Itens", "Teleporta para espadas, itens e acessórios spawnados", function(state)
    if state then
        while true do  
            wait(1)
            for _, item in pairs(game.Workspace:GetChildren()) do  
                if item:IsA("Tool") or item:IsA("Part") and (item.Name:find("Sword") or item.Name:find("Accessory") or item.Name:find("Item")) then  
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = item.Handle.CFrame  
                    wait(0.5)  
                    fireclickdetector(item.Handle.ClickDetector)
                end  
            end  
        end  
    end
end)

-- // Auto Coleta e Armazenamento de Frutas
AutoFruitSection:NewToggle("Auto Coletar Frutas", "Teleporta para frutas spawnadas e as armazena", function(state)
    if state then
        while true do  
            wait(1)
            for _, fruit in pairs(game.Workspace:GetChildren()) do  
                if fruit:IsA("Tool") and fruit.Name:find("Fruit") then  
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = fruit.Handle.CFrame  
                    wait(0.5)  
                    fireclickdetector(fruit.Handle.ClickDetector)
                    wait(1)
                    game.ReplicatedStorage.Remotes.StoreFruit:FireServer(fruit.Name)
                end  
            end  
        end  
    end
end)

-- // Auto Maestria de Espadas, Armas e Estilos de Luta
MasterySection:NewToggle("Auto Maestria", "Aumenta automaticamente a maestria de espadas, armas e estilos de luta", function(state)
    if state then
        while true do
            wait(1)
            game.ReplicatedStorage.Remotes.TrainMastery:FireServer()
        end
    end
end)

-- // Hit Kill
HitKillSection:NewToggle("Ativar Hit Kill", "Elimina instantaneamente inimigos com um golpe", function(state)
    if state then
        while true do
            wait(1)
            for _, enemy in pairs(game.Workspace.Enemies:GetChildren()) do
                if enemy:FindFirstChild("Humanoid") then
                    enemy.Humanoid.Health = 0
                end
            end
        end
    end
end)
