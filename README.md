# 🏋️‍♂️ Modelagem de Banco de Dados — Gym Classic

Este projeto documenta o processo completo de engenharia e modelagem de dados para a **Gym Classic**, uma rede fictícia de academias. A iniciativa surgiu da necessidade do estabelecimento em modernizar sua infraestrutura de informação, substituindo processos manuais por um sistema de banco de dados relacional robusto, capaz de otimizar a gestão operacional, elevar a qualidade do atendimento e suportar tomadas de decisão estratégicas para o aumento de receita.

O desenvolvimento abrangeu desde a fase de imersão no negócio, com entrevistas com a gestão para mapeamento de processos e levantamento de requisitos, até a construção técnica e validação dos três níveis fundamentais da modelagem de dados (Conceitual, Lógico e Físico).

---

## 🎯 Contexto e Objetivos

Com a expansão no número de frequentadores e na grade de atividades oferecidas, a gestão da Gym Classic identificou gargalos operacionais que impactavam o controle de turmas e o acompanhamento financeiro dos planos. 

Para resolver essas dores, o projeto foi estruturado para entregar:
- **Centralização de Dados Cadastrais:** Cadastro unificado de alunos, corpo docente (professores) e modalidades de planos oferecidos.
- **Gestão Operacional de Grade:** Controle rigoroso da oferta de aulas, salas utilizadas, horários e vínculo dos professores responsáveis.
- **Controle de Matrículas e Ocupação:** Registro detalhado dos alunos inscritos em cada aula, garantindo o cumprimento de limites operacionais de capacidade por turma.

---

## 📋 Levantamento de Requisitos e Dados

A partir de entrevistas com a gerência da academia, foram consolidados os requisitos essenciais do sistema:

### **Requisitos Funcionais**
1. Manter cadastro completo dos alunos (com históricos físicos e objetivos).
2. Manter cadastro detalhado dos professores.
3. Gerenciar o catálogo de planos de adesão da academia.
4. Controlar a grade de aulas ofertadas (locais, horários e durações).
5. Registrar o vínculo e histórico de inscrições dos alunos nas aulas.

### **Dados Mapeados por Entidade**
* **Aluno:** Nome, CPF, Idade, Altura, Peso, Plano, Objetivo.
* **Professor:** Nome, CPF, CREF, Telefone, Especialidade.
* **Aula:** Nome da aula, Horário, Duração, Sala, Capacidade Máxima.
* **Plano:** Nome do plano, Valor, Duração.

---

## 📐 Regras de Negócio Traduzidas para o Banco

As restrições operacionais da academia exigiram a implementação das seguintes regras diretas no modelo:

- **Responsabilidade Docente:** Toda aula deve possuir obrigatoriamente **apenas um** professor responsável, embora um professor possa ministrar **múltiplas aulas** em horários distintos.
- **Especialização de Professores:** Cada professor possui restrição de atuar em **apenas uma** especialidade técnica.
- **Multimatrícula do Aluno:** Um aluno pode se matricular e participar de **várias aulas**, desde que não haja conflito estrutural ou de lotação.
- **Garantia de Capacidade Máxima:** O sistema impede a matrícula de novos alunos em turmas que já atingiram o limite máximo de vagas estabelecido.

---

## 🛠️ O Ciclo de Modelagem (brModelo)

Toda a arquitetura do banco foi desenhada utilizando a ferramenta **brModelo**, dividida estritamente nas três fases clássicas da engenharia de dados:

1. **Modelo Conceitual:** Abstração de alto nível com o Diagrama Entidade-Relacionamento (DER), focado no entendimento do negócio sem preocupação com detalhes de implementação.
2. **Modelo Lógico:** Transformação do DER em um esquema relacional, com a definição formal de chaves primárias (PK), chaves estrangeiras (FK), aplicação das regras de normalização e resolução do relacionamento $N:N$ entre Aluno e Aula (gerando a tabela associativa de Matrícula).
3. **Modelo Físico:** Tradução do esquema lógico para scripts SQL DDL (Data Definition Language), aplicando os tipos de dados apropriados e restrições de integridade referencial.

---

## 📁 Estrutura do Repositório

```text
.
├── docs/               # Documentação detalhada dos requisitos, regras de negócio e print dos modelos conceitual, lógico e físico do projeto
├── modelos/              # Arquivos de modelagem gerados no brModelo
│   ├── modelo_conceitual/
│   ├── modelo_físico/
│   └── modelo_lógico/
└── README.md           # Documentação principal do repositório
