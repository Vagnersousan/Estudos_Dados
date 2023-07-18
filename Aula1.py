nome = input("Informe seu nome: ")
n1= float(input("Digite a primeira nota: "))
n2= float(input("Digite a segunda nota: "))
n3= float(input("Digite a terceira nota: "))
n4= float(input("Digite a quarta nota: "))

resultado = (n1+n2+n3+n4) / 4

print(resultado)

if resultado >= 6:
    print (nome, "Parabéns!!!! Você foi Aprovado.")

elif resultado == 5:
    print (nome, "Você está em Recuperação.") 

else:
    print (nome, "Que pena, você foi Reprovado.") 





