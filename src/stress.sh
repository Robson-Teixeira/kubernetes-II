
#!/bin/bash

for i in {1..10000}; do

    curl localhost:30000 # no Linux substituir 'localhost' pelo 'internal-ip' do node
    sleep $1 # intervalo em segundos recebido como parâmetro

done

# Executar no Git Bash, por exemplo
    # sh stress.sh 0.001
    # Caso queira salvar em arquivo, adicionar '> arquivo.txt' ao final do comando