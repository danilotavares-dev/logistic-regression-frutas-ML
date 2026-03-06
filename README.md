# Classificador de Qualidade de Frutas

Este projeto consiste em uma **API desenvolvida com FastAPI** para classificar a qualidade de frutas (por exemplo, **"Boa"** ou **"Ruim"**) com base em suas características físico-químicas. O modelo de *Machine Learning* utilizado foi treinado com **Regressão Logística**.

---

## Funcionalidades

- **Previsão de Qualidade**: Recebe dados de uma fruta e retorna a classificação (*Boa* ou *Ruim*) junto com a probabilidade associada.
- **Modelo Treinado**: Utiliza um modelo do *scikit-learn* previamente treinado e serializado (`.pkl`).
- **Containerização**: Projeto pronto para execução em ambiente Docker.

---

## Tecnologias Utilizadas

- **Python 3.13**
- **FastAPI** – Framework web
- **Scikit-learn** – Machine Learning
- **Pandas** – Manipulação e análise de dados
- **Docker** – Containerização da aplicação

---

## Estrutura do Projeto

```text
├── main.py                     # Código fonte da API (rota /classify)
├── modelo_frutas.ipynb         # Notebook de EDA, pré-processamento e treinamento
├── modelo_qualidade_frutas.pkl # Modelo treinado serializado
├── Dockerfile                  # Configuração da imagem Docker
├── requiriments.txt            # Dependências do projeto
```

> ⚠️ Observação: o arquivo de dependências está nomeado como `requiriments.txt` no projeto original.

---

## 🚀 Como Executar

### Pré-requisitos

- Python **3.13+**
- Docker (opcional)

---

### 1️⃣ Execução Local

Instale as dependências:

```bash
pip install -r requiriments.txt
```

Inicie o servidor com o Uvicorn:

```bash
uvicorn main:app --reload
```

A API estará disponível em:

```
http://127.0.0.1:8000
```

---

### 2️⃣ Execução com Docker

Construa a imagem Docker:

```bash
docker build -t classificador-frutas .
```

Execute o container:

```bash
docker run -p 80:80 classificador-frutas
```

A API ficará acessível em:

```
http://localhost:80
```

---

## 🔌 Uso da API

### Endpoint

- **URL**: `/classify`
- **Método**: `POST`
- **Descrição**: Classifica a qualidade de uma fruta com base em suas características.

---

### Exemplo de Requisição (JSON)

> O campo `A_id` é obrigatório no esquema, mas **não influencia a predição**.

```json
{
  "A_id": 1,
  "Size": -1.2,
  "Weight": -2.8,
  "Sweetness": 3.6,
  "Crunchiness": 1.5,
  "Juiciness": 0.8,
  "Ripeness": 0.8,
  "Acidity": -0.7
}
```

---

### Exemplo de Resposta

```json
{
  "Qualidade": "Boa",
  "Probabilidade": 0.87
}
```

---

## 🧠 Sobre o Modelo

O modelo foi desenvolvido no notebook `modelo_frutas.ipynb`, utilizando um *dataset* de qualidade de frutas.

- **Entradas (Features)**:
  - Tamanho (*Size*)
  - Peso (*Weight*)
  - Doçura (*Sweetness*)
  - Crocância (*Crunchiness*)
  - Suculência (*Juiciness*)
  - Maturação (*Ripeness*)
  - Acidez (*Acidity*)

- **Algoritmo**: Regressão Logística (*Logistic Regression*)
- **Tipo de Problema**: Classificação Binária (*Boa / Ruim*)

---

## 📌 Observações Finais

Este projeto tem fins educacionais e demonstra a integração entre **Machine Learning**, **APIs REST** e **Docker**, seguindo boas práticas de organização e deploy de modelos em produção.
