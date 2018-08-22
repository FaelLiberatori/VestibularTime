file = 0

function OpenFile()
  local i = 0
  while file ~= nil
  do
    i = i + 1
    file = io.open("VestibularTime/Time" .. i ..".txt", "r")
  end
  file = io.open("VestibularTime/Time" .. i ..".txt", "w+")
end

function WriteFile(text2write)
  io.output(file)
  io.write("\n" .. text2write)
end

function convertSec2Time(spendTime)
  local stringTime
  if spendTime >= 60 then
    local min = math.floor(spendTime / 60)
    local sec = spendTime % 60
    stringTime = min .. " minuto"
    if min ~= 1 then
      stringTime = stringTime .. 's'
    end

    if min > 0 then
      stringTime = stringTime .. " e " .. sec .. " segundo"
      if sec ~= 1 then
        stringTime = stringTime .. 's'
      end
    end
  else
    stringTime = spendTime .. " segundo"
    if spendTime ~= 1 then
      stringTime = stringTime .. 's'
    end
  end
  return stringTime;
end

print("\nOlá, seja bem-vindo ao VestibularTime! Eeste software vai te ajudar a contabilizar o tempo gasto em cada questão de seu vestibular.\
\nComandos:\
Próxima questão: Enter\
Fanalizar redação (se houver), digite: redação\
Finalizar vestibular, digite: finalizar ou terminar\
\nAperte qualquer tecla para começar. Seu progresso será salvo no arquivo TimeN dentro da pasta VestibularTime na sua home de usuário.")

OpenFile()
io.stdin:read()
vestibularStartTime = os.time()
i = 1

while true do
  print("\nAperte enter quando terminar a questão...")

  local initialTime = os.time()
  local answer = io.stdin:read()
  local spendTime = os.difftime(os.time(), initialTime)
  local stringTime = convertSec2Time(spendTime)

  local addText

  if answer == "redação" then
    addText = "Redação: " .. stringTime
    WriteFile(addText)
    print(addText)
  elseif answer == "terminar" or answer == "finalizar" then
    vestibularSpendTime = os.difftime(os.time(), vestibularStartTime)
    stringVestibularTime = convertSec2Time(vestibularSpendTime)
    print("\nTempo Total Gasto: " .. stringVestibularTime)
    WriteFile("\nTempo Total Gasto: " .. stringVestibularTime)
    WriteFile("\n------ Fim do arquivo ------")
    io.close(file)
    print("\nVestibular finalizado\n")
    os.exit()
  elseif answer == "" then
    addText = "Questão " .. i .. ": " .. stringTime
    WriteFile(addText)
    print(addText)
    i = i + 1
  else
    print ("Erro, comando inválida. Recomeçando contagem de tempo...")
  end
end
