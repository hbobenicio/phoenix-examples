# API

## CRUD Usuário

- **C**reate:
  - ACTION: `POST`
  - URL: `/api/usuarios`
  - BODY: 
  ```json
  {
    "nome": "Fulano",
    "email": "fulano@gmail.com",
    "senha": "1234"
  }
  ```
- **R**etrieve:
- **U**pdate:
- **D**elete:

## Testando a API com CURL

```bash
curl -X POST http://localhost:4000/api/usuarios --data \
> '{"nome":"Hugo", "email": "hbobenicio@gmail.com", "senha":"1234"}'
```
