"""
Exemplo de Variavel de Classe em Python
"""
class Produto:

    instance_count = 0
    nome_sistema = 'Default'

    def __init__(self, nome: str, unidade, valor):
        self.__id = Produto.instance_count + 1
        self.__nome = nome
        self.__unidade = unidade
        self.__valor = valor
        self.first_name = self.__first_name()

    def desconto(self, porcentagem):
        """ Retorna o valor do produto com o desconto"""
        return self.__valor * (1 - (porcentagem/100))

    def __first_name(self):
        """Exemplo de método privado que retorna o primeiro do produto"""
        return self.__nome.split(' ')[0]


print(Produto.nome_sistema)  # '' por que o default.
print('Produto Default: ', id(Produto.nome_sistema))

Produto.nome_sistema = 'Maxpró ERP'
print(Produto.nome_sistema)  # Maxpró ERP


p1 = Produto('Teclado Megaware Multimedia', 'UN', 23.90)
print(p1.nome_sistema)  # Erikles: Maxpró ERP, Guimarães: Não sabe.

""" Comportamento diferente do Delphi.
Diferente do Delphi, no Python, se eu faço uma atribuição de valor a uma
Variável de Classe, porém usando um objeto. Eu, na verdade, estou criando
uma nova variável/propriedade dinâmica dentro do objeto. A variável de classe,
e demais objetos, continuam inalteradas.
"""
p1.nome_sistema = 'Sismais NF'
print('p1 Sismais NF: ', p1.nome_sistema)  # Sismais NF

p2 = Produto('Mouse Gamewr', 'UN', 99.99)
print('p2: ', p2.nome_sistema)  # Erikles e Guimarães: Sismais NF, Resultado: Maxpró ERP.
p2.nome_sistema = 'Outro novo sistema'
print(p2.nome_sistema)

print('#########')
print(p1.nome_sistema)
print(Produto.nome_sistema)


# O Python tem Tipagem Dinamica, e também criação de properties (variáveis de objetos) de forma dinâmica.
# p2.nome_animal = 'cachorro grande'
# print(p2.nome_animal)
# print(p2.nome_animal.title())


# # Método de Instância
# print(p1.desconto(10))  # 21.51

# # p1.__first_name()  # AttributeError: 'Produto' object has no attribute '__first_name'
# # Outra forma de fazer:
# print(Produto.desconto(p1, 10))  # 21,51

# print(p1.first_name)
