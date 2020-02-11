# Validador (PT-BR)


Este projeto tem como objetivo principal aplicação de estudos Flutter, e colaborar com a comunidade.

#Exemplo de utilização.


Validador()
    .add(Validar.CPF, msg: 'CPF Inválido')
    .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
    .minLength(11)
    .maxLength(11)
    .valido(value,clearNoNumber: true);
    
