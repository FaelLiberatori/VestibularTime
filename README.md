# VestibularTime
Saiba onde você precisa melhorar para se sair bem no vestibular cronometrando quanto gasta em cada questão com esse simples script Lua.

# Como iniciar
Optei por não oferecer pacotes binários para evitar a necessidade de compilação para plataformas individuais. Assim sendo, é necessário ter um interpretador do Lua instalado para iniciar o script. Após a instalação, basta executá-lo normalmente. Por exemplo, utilizando a versão 5.3:

> lua5.3 VestibularTime.lua

Note que antes de usar é necessário a criação da pasta "VestibularTime" dentro de sua pasta home, onde será salvar os arquivos.

# Como Usar
* Utilize enter para ir para próxima questão, o número da questão e o tempo gasto nela será automaticamente calculado, exibido no terminal e gravado em um arquivo chamado TimeN.txt, onde N é número do arquivo gerado. O mesmo se localiza dentro da pasta VestibularTime, que você deverá criar em sua pasta home.
* Para o tempo gasto ser salvo como redação e não como questão, digite "redação" antes de pressionar o enter.
* Para finalizar o scrip digite "finalizar" ou "terminar" e aperte enter.
