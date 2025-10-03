# English
## GENDER WAGE DIFFERENTIALS IN BRAZIL (2015-2023)

Undergraduate Thesis (TCC) in Economics  
Author: Gabriel Gaze Gonçalves Fontenele Gomes  
Advisor: Prof. Dr. Julio Vicente Cateia  
Federal University of Piauí (UFPI) - 2025  

---

### 📌 About the Project

This repository contains the script developed for the TCC *"Gender Wage Differentials in Brazil from 2015 to 2023."*  
The script automatically performs the following steps:

1. Imports all datasets from the Continuous National Household Sample Survey (PNADC) by IBGE, from 2015 up to the year prior to the current year.  
2. Cleans and processes the data, ensuring consistency across variables.  
3. Generates graphs and visualizations of earnings by gender.  
4. Runs a **matching model** that compares the earnings of men and women with similar characteristics, allowing the decomposition of the wage gap into observable factors and discrimination.

---

### 📚 Academic Context

#### 1. Concept of Wage Inequality
Wage inequality can have both positive and negative effects.  
- **Positive:** wage differences can create incentives to work, invest, and innovate when associated with acceptable factors such as qualifications.  
- **Negative:** when wage gaps do not reflect productivity, they lead to social erosion and misallocation of resources. Wage discrimination highlights these unjustified differences.

#### 2. Justification and Central Hypothesis
Although female participation in the labor market has increased, barriers persist.  
This study aims to quantitatively analyze gender wage inequality in Brazil from 2015 to 2023.  
**Central hypothesis:** discrimination is a relevant factor contributing to gender wage inequality.

#### 3. Why the Simple Average Is Not Enough
- In 2023, the average female wage was about 19% lower than the male wage.  
- Raw differences do not necessarily reflect discrimination; they may arise from disparities in education, experience, and other productive factors.  
- To isolate discrimination, we use a **non-parametric decomposition** based on matching, comparing individuals with similar characteristics.

#### 4. Methodology
The study adopts a quantitative approach based on PNADC (2015-2023, excluding 2020-2021).  

**Main steps:**

1. **Descriptive Analysis:** weighted estimates accounting for the complex survey design.  
2. **Mincerian Equations:** assessing determinants of individual earnings, including education, experience, and gender.  
3. **Non-Parametric Decomposition (Ñopo Matching, 2008):** decomposes the wage gap into observable differences and discrimination.

#### 5. Main Results
- **Determinants of Wages:** education, experience, and gender directly impact earnings.  
- **Gender:** a consistently negative coefficient indicates persistent wage inequality.  
- **Human Capital Returns:** women earn less on average due to lower returns to education and experience.  
- **Sectoral and Racial Concentration:** women are concentrated in lower-paying sectors; wage gaps also persist across races.  
- **Discrimination:** on average, 86.62% of the wage gap is explained by discrimination in favor of men. This level remained nearly stable between 2015 and 2023.

#### 6. Limitations and Remarks
- **Self-Selection Bias:** there is no complete correction for female labor participation conditioned by reproductive and family factors.  
- **Matching Restriction:** only ~44% of observations were included in the “common support,” limiting model complexity and representativeness.

---

### ⚙️ How to Run the Script

1. Ensure Python 3.x is installed along with the required libraries: `PNADcIBGE`, `tidyverse`, `readr`, `forcats`, `ggplot2`, `stringr`, `srvyr`, `decr`, `texreg`, `xtable`, `survey`.  
2. Run the main script (`00_run_it_all.r`) to download, clean, and analyze PNADC data.  
3. Graphs will be automatically generated in the `figs/` folder.  
4. The matching model will run and display results of the gender wage decomposition.

---

### 📂 Repository Structure


# PORTUGUESE
## DIFERENCIAIS SALARIAIS POR GÊNERO NO BRASIL (2015-2023)

Trabalho de Conclusão de Curso (TCC) em Ciências Econômicas  
Autor: Gabriel Gaze Gonçalves Fontenele Gomes  
Orientador: Prof. Dr. Julio Vicente Cateia  
Universidade Federal do Piauí (UFPI) - 2025  

---

### 📌 Sobre o Projeto

Este repositório contém o script desenvolvido para o TCC "Diferenciais Salariais por Gênero no Brasil de 2015 a 2023".  
O script realiza as seguintes etapas automaticamente:

1. Importa todas as bases da Pesquisa Nacional por Amostra de Domicílios Contínua (PNADC) do IBGE, de 2015 até o ano anterior ao ano corrente.  
2. Realiza o tratamento e limpeza dos dados, garantindo consistência nas variáveis.  
3. Gera gráficos e visualizações dos rendimentos por gênero.  
4. Executa um modelo de **matching**, que compara os rendimentos de homens e mulheres com características semelhantes, permitindo decompor o diferencial salarial em fatores observáveis e discriminação.

---

### 📚 Contexto Acadêmico

#### 1. Conceito de Desigualdade Salarial
A desigualdade salarial pode ter efeitos positivos e negativos.  
- Positivos: diferenças de remuneração podem gerar incentivos para trabalhar, investir e inovar, quando associadas a fatores aceitáveis como qualificações.  
- Negativos: quando diferenças salariais não refletem produtividade, há corrosão social e má alocação de recursos. A discriminação salarial evidencia essas diferenças injustificadas.

#### 2. Justificativa e Hipótese Central
Embora a participação feminina no mercado de trabalho tenha avançado, barreiras persistem.  
O objetivo deste trabalho é analisar quantitativamente a desigualdade salarial por gênero no Brasil de 2015 a 2023.  
**Hipótese central:** a discriminação é um fator relevante para a existência de desigualdade salarial por gênero.

#### 3. Por Que a Média Simples Não É Suficiente
- Em 2023, o salário médio feminino foi cerca de 19% menor que o masculino.  
- Diferenças brutas não refletem necessariamente discriminação; podem ocorrer por disparidades de educação, experiência e outros fatores produtivos.  
- Para isolar a discriminação, utilizamos uma **decomposição não paramétrica** baseada em matching, comparando indivíduos com características semelhantes.

#### 4. Metodologia
O estudo utilizou abordagem quantitativa baseada na PNADC (2015-2023, exceto 2020-2021).  

As etapas principais:

1. **Análise Descritiva:** estimativas ponderadas considerando o plano amostral complexo.  
2. **Equações Mincerianas:** avaliação de fatores determinantes dos rendimentos individuais, incluindo educação, experiência e gênero.  
3. **Decomposição Não Paramétrica (Matching de Ñopo, 2008):** decompõe a desigualdade salarial em diferenças observáveis e discriminação.

#### 5. Principais Resultados
- **Fatores Determinantes Salariais:** educação, experiência e gênero impactam diretamente os salários.  
- **Gênero:** coeficiente negativo consistente indica desigualdade salarial persistente.  
- **Prêmio por Capital Humano:** mulheres recebem menos em média devido a menor retorno de educação e experiência.  
- **Concentração Setorial e Raça:** mulheres se concentram em setores com salários menores; disparidades salariais persistem também por raça.  
- **Discriminação:** média de 86,62% da desigualdade salarial é explicada pela discriminação em favor dos homens. O nível se manteve quase estável entre 2015 e 2023.

#### 6. Limitações e Observações
- **Viés de Autoseleção:** não há correção completa para participação feminina condicionada a fatores reprodutivos e familiares.  
- **Restrição do Matching:** apenas ~44% das observações foram incluídas nos “suportes comuns”, limitando a complexidade do modelo e a representatividade.

---

### ⚙️ Como Rodar o Script

1. Certifique-se de ter Python 3.x instalado, além das bibliotecas necessárias: `PNADcIBGE`, `tidyverse`, `readr`, `forcats`, `ggplot2`, `stringr`, `srvyr`, `decr`, `texreg`, `xtable`, `survey`. 
2. Execute o script principal (`00_run_it_all.r`) para baixar, tratar e analisar os dados da PNADC.  
3. Os gráficos serão gerados automaticamente na pasta `figs/`.  
4. O modelo de matching rodará e exibirá os resultados da decomposição salarial por gênero.

---

### 📂 Estrutura do Repositório
