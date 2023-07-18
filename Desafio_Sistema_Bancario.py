menu = """


[1] Depositar
[2] Sacar
[3] Extrato
[0] Sair


=> """

saldo = 0
limite = 500
extrato = ""
numero_saques = 0
LIMITE_SAQUES = 3

while True:

    opcao = input(menu)

    if opcao == "1":
        valor = float(input("Informe o Valor do depósito: "))

        if valor > 0:
            saldo += valor
            extrato += f"Depósito: R$ {valor:.2f}\n"

        else:
            print("Operação falhou! O valor informado é inválido.")  
    
    elif opcao == "2":
        valor = float(input("Informe o Valor do saque: "))

        excedeu_saldo = valor > saldo

        excedeu_limite = valor > limite

        excedeu_saques = numero_saques >= LIMITE_SAQUES

        if excedeu_saldo:
            print("Operaçao falhou! Você não tem saldo suficiente.")

        elif excedeu_limite:
            print("Operação falhou! O Valor do saque excede o limite.")

        elif excedeu_saques:
            print ("Operação falhou! Número máximo de saques excedido.")

        elif valor > 0:
            saldo -= valor
            extrato += f"saque: R$ {valor:.2f}\n"
            numero_saques += 1 

        else:
            print("Operação falhou! O Valor informado é inválido.")

    elif opcao == "3":
        print("\n*************** EXTRATO **************")
        print("Não foram realizadas movimentações." if not extrato else extrato)
        print(f"\nSaldo: R$ {saldo:.2f}")
        print("**************************************")

    elif opcao == "0":
        break

    else:
        print("Operação inválida.A opção informada não foi reconhecida! Gentileza informar uma opção válida.")    


