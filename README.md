# Validador (PT-BR)


Este projeto tem como objetivo principal aplicação de estudos Flutter, e colaborar com a comunidade.


### Instalação

```
dependencies:
  validadores: ^1.0.9
```



#Exemplo de utilização.

```dart    

Validador()
     .add(Validar.CPF, msg: 'CPF Inválido')
     .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
     .minLength(11)
     .maxLength(11)
     .valido(value,clearNoNumber: true);`
   
```


```dart

            @TextFormField(
                  validator: (value) {
                    // Aqui entram as validações
                    return Validador()
                        .add(Validar.CPF, msg: 'CPF Inválido')
                        .add(Validar.OBRIGATORIO, msg: 'Campo obrigatório')
                        .minLength(11)
                        .maxLength(11)
                        .valido(value,clearNoNumber: true);

                  },
                  decoration: InputDecoration(
                    helperText: 'informe seu cpf',
                    hintText: '123.456.789-00',
                    labelText: 'CPF'
                  ),
                ),

```

### Validadores

- CPF
- CNPJ
- OBRIGATORIO
- EMAIL
- IGUAL
- Valor Mínimo
- Valor Máximo
- Tamanho Mínimo
- Tamanho Máximo
  
     
     