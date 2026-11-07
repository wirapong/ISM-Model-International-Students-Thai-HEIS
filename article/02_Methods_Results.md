# Methods and Results — ISM PLS-SEM Study

**Thesis:** The Information Services Management (ISM) Model for International Students in Thailand Higher Education Institutions

**Researcher:** Paiboon Manororm (667080012-5)
**Advisor:** Assoc. Prof. Dr. Wirapong Chansanam
**Faculty of Informatics / Graduate School, Khon Kaen University**

---

## 3. Research Methods

### 3.1 Research Design

This study adopted a quantitative cross-sectional survey design to examine causal relationships among constructs related to information services management for international students in Thai higher education. Partial Least Squares Structural Equation Modeling (PLS-SEM) was selected as the primary analytical technique. PLS-SEM is appropriate for this study because (a) the research is in an early stage of ISM model development with limited prior empirical evidence, (b) the model includes multiple endogenous constructs measured simultaneously, and (c) the study prioritizes prediction and explanation of variance (Hair et al., 2019; Ringle et al., 2015).

### 3.2 Sample and Data Collection

The study population comprised international students enrolled at Thai higher education institutions. Sampling was conducted across four institution types: autonomous universities (*n* = 150), private universities (*n* = 130), Rajabhat universities (*n* = 67), and technology and occupational universities (*n* = 48), targeting a minimum of 250 valid responses as recommended by Hair et al. (2019) for PLS-SEM with 12 parameters. A total of **354 usable responses** were obtained with no missing values. Participants were required to: (1) be currently enrolled as an international student at a Thai university, (2) have met English language proficiency admission requirements, and (3) have studied in Thailand for at least three months.

### 3.3 Measurement Instrument

Data were collected using a self-administered questionnaire developed from the literature on information services management, student satisfaction, cultural adjustment, and student needs. Items were rated on a **five-point Likert scale** (1 = strongly disagree to 5 = strongly agree). Content validity was established by three domain experts in information sciences using the Index of Item Objective Congruence (IOC) prior to data collection.

Based on the initial pool of 32 items across seven constructs, the final instrument was refined through measurement model assessment. Ten items exhibiting outer loadings below 0.70 were removed, and one construct — **Image and Prestige (HT, 3 items)** — was excluded due to inadequate discriminant validity (HTMT ratio with Administrative and Staff Support = 0.955, far exceeding the 0.90 threshold), indicating conceptual overlap between institutional image and administrative support as perceived by international students. The final instrument comprises **22 items across six constructs** (Table 1).

**Table 1.** *Construct Operationalization (Final Instrument)*

| Code | Construct Name | Items | No. of Items | Description |
|------|----------------|-------|:---:|-------------|
| **AR** | Academic and Education Quality | AR8–AR10 | 3 | Perceived quality of academic resources and educational provision at the Thai university |
| **HS** | Administrative and Staff Support | HS14–HS18 | 5 | Quality of administrative services, staff responsiveness, and institutional support for international students |
| **PA** | Psychological Adaptation | PA28–PA32 | 5 | Students' psychological adjustment and mental well-being during study in Thailand |
| **LC** | Sociocultural Adaptation | LC11–LC13 | 3 | Ability to adapt socially and culturally to Thai society and campus environment |
| **IA** | Information Needs | IA1–IA3 | 3 | Degree to which the institution satisfies students' information-seeking needs |
| **SI** | Situational Issue | SI22–SI24 | 3 | Situational challenges and barriers encountered by international students |

*Note.* AR and HS are exogenous (independent) constructs; PA, LC, IA, and SI are endogenous (dependent) constructs.

### 3.4 PLS-SEM Analysis Strategy

Analysis was performed using **R** (version 4.6.0) with the **seminr** package (version 2.4.2; Hair et al., 2019). All constructs were specified as reflective (common factor) measurement models, consistent with the theoretical rationale that each construct causes the observed item responses. A **Direct/Parallel structural model** was specified, wherein two exogenous constructs (AR and HS) each simultaneously and directly predict all four endogenous constructs (PA, LC, IA, and SI), yielding eight hypothesized structural paths.

The analysis followed a two-step procedure (Hair et al., 2019):

**Step 1 — Measurement model assessment** evaluated:

- Outer loadings (threshold ≥ 0.70)
- Internal consistency: Cronbach's alpha (*α*) and composite reliability (*ρ*C), threshold 0.70–0.95; rhoA (*ρ*A), threshold 0.70–0.95
- Convergent validity: Average Variance Extracted (AVE, threshold ≥ 0.50)
- Discriminant validity: Heterotrait-Monotrait Ratio of Correlations (HTMT, threshold < 0.90)

**Step 2 — Structural model assessment** evaluated:

- Variance Inflation Factor (VIF, threshold < 5.0) for collinearity
- Path coefficients (*β*) and coefficient of determination (*R*² and adjusted *R*²)
- Effect sizes (*f*²): small ≥ 0.02, medium ≥ 0.15, large ≥ 0.35 (Cohen, 1988)
- Hypothesis testing via bootstrapping (5,000 resamples, seed = 2026, two-tailed, *α* = 0.05)

---

## 4. Results

### 4.1 Descriptive Statistics

All 354 responses were valid with no missing data. Item means ranged from 4.00 (HS14) to 4.61 (PA30), indicating generally high levels of agreement across all constructs (Table 2).

**Table 2.** *Descriptive Statistics by Item (N = 354)*

| Item | Construct | Mean | SD |
|------|-----------|:----:|:--:|
| AR8  | AR — Academic & Education Quality | 4.342 | 0.803 |
| AR9  | AR — Academic & Education Quality | 4.336 | 0.777 |
| AR10 | AR — Academic & Education Quality | 4.308 | 0.834 |
| HS14 | HS — Administrative & Staff Support | 4.000 | 1.070 |
| HS15 | HS — Administrative & Staff Support | 4.172 | 0.968 |
| HS16 | HS — Administrative & Staff Support | 4.195 | 0.972 |
| HS17 | HS — Administrative & Staff Support | 4.195 | 0.975 |
| HS18 | HS — Administrative & Staff Support | 4.034 | 1.001 |
| PA28 | PA — Psychological Adaptation | 4.393 | 0.811 |
| PA29 | PA — Psychological Adaptation | 4.596 | 0.624 |
| PA30 | PA — Psychological Adaptation | 4.605 | 0.627 |
| PA31 | PA — Psychological Adaptation | 4.466 | 0.775 |
| PA32 | PA — Psychological Adaptation | 4.466 | 0.790 |
| LC11 | LC — Sociocultural Adaptation | 4.229 | 0.913 |
| LC12 | LC — Sociocultural Adaptation | 4.186 | 1.007 |
| LC13 | LC — Sociocultural Adaptation | 4.153 | 1.023 |
| IA1  | IA — Information Needs | 4.277 | 0.905 |
| IA2  | IA — Information Needs | 4.345 | 0.821 |
| IA3  | IA — Information Needs | 4.446 | 0.824 |
| SI22 | SI — Situational Issue | 4.331 | 0.907 |
| SI23 | SI — Situational Issue | 4.424 | 0.790 |
| SI24 | SI — Situational Issue | 4.288 | 0.898 |

### 4.2 Measurement Model Assessment

#### 4.2.1 Reliability and Convergent Validity

Table 3 presents internal consistency and convergent validity results. All *α* values ranged from 0.739 to 0.873, all *ρ*A values from 0.740 to 0.875, and all *ρ*C values from 0.738 to 0.873, comfortably within the 0.70–0.95 range. AVE values met the ≥ 0.50 threshold for five of the six constructs. SI yielded AVE = 0.485, slightly below the threshold; given the theoretical importance and content validity of all three SI items, the construct was retained, with this limitation acknowledged.

**Table 3.** *Reliability and Convergent Validity*

| Construct | *α* | *ρ*A | *ρ*C | AVE | Status |
|-----------|:---:|:----:|:----:|:---:|:------:|
| AR — Academic & Education Quality | 0.816 | 0.825 | 0.819 | 0.603 | ✓ |
| HS — Administrative & Staff Support | 0.873 | 0.875 | 0.873 | 0.580 | ✓ |
| PA — Psychological Adaptation | 0.860 | 0.861 | 0.860 | 0.551 | ✓ |
| LC — Sociocultural Adaptation | 0.844 | 0.847 | 0.842 | 0.641 | ✓ |
| IA — Information Needs | 0.745 | 0.759 | 0.754 | 0.506 | ✓ |
| SI — Situational Issue | 0.739 | 0.740 | 0.738 | 0.485 | ⚠ |

*Note.* *α* = Cronbach's alpha; *ρ*A = rhoA; *ρ*C = composite reliability; AVE = Average Variance Extracted. Thresholds: *α*/*ρ*A/*ρ*C ≥ 0.70; AVE ≥ 0.50 (Hair et al., 2019). ⚠ = marginally below AVE threshold; retained for content validity.

#### 4.2.2 Outer Loadings

All bootstrapped outer loadings were statistically significant (*p* < 0.001), with 95% confidence intervals that did not cross zero (Table 4). Most loadings exceeded the 0.70 benchmark; the lowest loading was IA3 (λ = 0.637), which was retained due to its content validity contribution.

**Table 4.** *Standardized Outer Loadings (Bootstrap, *n* = 5,000)*

| Item | Construct | Loading | 95% CI |
|------|-----------|:-------:|--------|
| AR8  | AR | 0.693 | [0.615, 0.763] |
| AR9  | AR | 0.818 | [0.754, 0.876] |
| AR10 | AR | 0.812 | [0.748, 0.875] |
| HS14 | HS | 0.784 | [0.702, 0.852] |
| HS15 | HS | 0.765 | [0.682, 0.839] |
| HS16 | HS | 0.721 | [0.638, 0.791] |
| HS17 | HS | 0.720 | [0.628, 0.798] |
| HS18 | HS | 0.813 | [0.753, 0.863] |
| PA28 | PA | 0.705 | [0.615, 0.791] |
| PA29 | PA | 0.791 | [0.711, 0.861] |
| PA30 | PA | 0.779 | [0.696, 0.854] |
| PA31 | PA | 0.716 | [0.622, 0.802] |
| PA32 | PA | 0.718 | [0.619, 0.807] |
| LC11 | LC | 0.869 | [0.808, 0.922] |
| LC12 | LC | 0.768 | [0.695, 0.831] |
| LC13 | LC | 0.760 | [0.692, 0.823] |
| IA1  | IA | 0.763 | [0.678, 0.840] |
| IA2  | IA | 0.729 | [0.642, 0.811] |
| IA3  | IA | 0.637 | [0.517, 0.741] |
| SI22 | SI | 0.732 | [0.646, 0.813] |
| SI23 | SI | 0.696 | [0.620, 0.767] |
| SI24 | SI | 0.660 | [0.556, 0.759] |

*Note.* All loadings significant at *p* < 0.001. CI = percentile bootstrap confidence interval.

#### 4.2.3 Discriminant Validity

**Table 5.** *Heterotrait-Monotrait Ratio of Correlations (HTMT)*

| | AR | HS | PA | LC | IA | SI |
|--|:--:|:--:|:--:|:--:|:--:|:--:|
| **AR** | — | | | | | |
| **HS** | 0.777 | — | | | | |
| **PA** | 0.723 | 0.713 | — | | | |
| **LC** | 0.852 | 0.862 | 0.625 | — | | |
| **IA** | 0.727 | 0.690 | 0.585 | 0.727 | — | |
| **SI** | 0.831 | **0.904** | 0.841 | 0.769 | 0.749 | — |

*Note.* All HTMT values below 0.90 except HS↔SI = 0.904. This marginally exceeds the threshold, suggesting partial conceptual overlap between Administrative Support and Situational Issues — an interpretively meaningful finding discussed in the limitations section. Discriminant validity is considered largely established (Hair et al., 2019).

### 4.3 Structural Model Assessment

#### 4.3.1 Collinearity (VIF)

VIF values for all antecedent–endogenous combinations equaled 1.759 (AR) and 1.759 (HS), well below the threshold of 5.0, confirming that multicollinearity is not a concern in this model.

#### 4.3.2 Coefficient of Determination (*R*²)

**Table 6.** *R² and Adjusted R² for Endogenous Constructs*

| Construct | *R*² | Adj. *R*² | Interpretation |
|-----------|:----:|:---------:|----------------|
| PA — Psychological Adaptation | 0.578 | 0.575 | Moderate |
| LC — Sociocultural Adaptation | 0.838 | 0.838 | Substantial |
| IA — Information Needs | 0.557 | 0.554 | Moderate |
| SI — Situational Issue | 0.862 | 0.861 | Substantial |

*Note.* Interpretation based on Hair et al. (2019): weak < 0.25, moderate ≥ 0.25, substantial ≥ 0.75.

The model explains substantial variance in Sociocultural Adaptation (*R*² = 0.838) and Situational Issue (*R*² = 0.862), and moderate variance in Psychological Adaptation (*R*² = 0.578) and Information Needs (*R*² = 0.557).

#### 4.3.3 Effect Sizes (*f*²)

**Table 7.** *Cohen's f² Effect Sizes*

| Path | *f*² | Interpretation |
|------|:----:|----------------|
| AR → PA | 0.164 | Medium |
| AR → LC | 0.573 | Large |
| AR → IA | 0.174 | Medium |
| AR → SI | 0.273 | Medium–Large |
| HS → PA | 0.146 | Medium |
| HS → LC | 0.598 | Large |
| HS → IA | 0.113 | Small |
| HS → SI | **1.291** | **Very Large** |

*Note.* Thresholds: small ≥ 0.02, medium ≥ 0.15, large ≥ 0.35 (Cohen, 1988; Hair et al., 2019).

### 4.4 Hypothesis Testing

Table 8 reports the bootstrapped structural path results (5,000 resamples, two-tailed, *α* = 0.05). Seven of eight hypothesized paths were statistically supported.

**Table 8.** *Structural Path Coefficients and Hypothesis Testing Results*

| Hyp. | Path | *β* | SE | *t* | 95% CI | *p* | Decision |
|:----:|------|:---:|:--:|:---:|--------|:---:|:--------:|
| H1a | AR → PA | 0.416 | 0.133 | 3.131 | [0.171, 0.694] | < .001 | **Supported ✓** |
| H1b | AR → LC | 0.483 | 0.112 | 4.308 | [0.255, 0.695] | < .001 | **Supported ✓** |
| H1c | AR → IA | 0.469 | 0.203 | 2.307 | [0.090, 0.876] | .016 | **Supported ✓** |
| H1d | AR → SI | 0.308 | 0.130 | 2.370 | [0.056, 0.558] | .018 | **Supported ✓** |
| H3a | HS → PA | 0.392 | 0.131 | 2.982 | [0.122, 0.635] | .010 | **Supported ✓** |
| H3b | HS → LC | 0.490 | 0.111 | 4.407 | [0.278, 0.710] | < .001 | **Supported ✓** |
| H3c | HS → IA | 0.322 | 0.187 | 1.722 | [−0.052, 0.662] | .104 | Not Supported ✗ |
| H3d | HS → SI | **0.669** | 0.120 | **5.590** | [0.429, 0.891] | < .001 | **Supported ✓** |

*Note.* *β* = standardized path coefficient; SE = bootstrap standard error (SD of 5,000 resamples); *t* = *t*-statistic (Original Est. / Bootstrap SE); 95% CI = percentile bootstrap confidence interval. VIF for all predictors = 1.759 (< 5.0). *** *p* < .001; ** *p* < .01; * *p* < .05.

### 4.5 PLS-SEM Path Model

The figure below presents the final ISM PLS-SEM model (Model B — Direct/Parallel) with standardized path coefficients, item loadings, and *R*² values for all endogenous constructs.

![ISM PLS-SEM Direct/Parallel Model — Model B](ISM_PLS_Model_Diagram.png)

**Figure 1.** *ISM PLS-SEM Direct/Parallel Model (Model B)*

The figure illustrates the final ISM PLS-SEM model (n = 354, 6 constructs, 8 structural paths, 22 indicators). Blue rectangles on the left represent the two exogenous constructs: Academic and Education Quality (AR) and Administrative and Staff Support (HS). Green ovals on the right represent the four endogenous constructs: Psychological Adaptation (PA, R² = 0.578), Sociocultural Adaptation (LC, R² = 0.838), Information Needs (IA, R² = 0.557), and Situational Issue (SI, R² = 0.862). Brown rectangles at the outer edges represent observed indicator items, with standardized loadings in parentheses. Solid arrows indicate statistically significant structural paths (p < 0.05, two-tailed bootstrap), annotated with standardized path coefficients (β) and t-statistics. The dashed arrow (HS → IA) represents a non-significant path (β = 0.322, p = 0.104). R² values displayed inside each endogenous construct oval reflect the proportion of variance explained by the two exogenous constructs jointly. Bootstrap resamples = 5,000; seed = 2026; software: R 4.6.0 with seminr 2.4.2.

### 4.6 Summary of Findings

Seven of eight hypothesized structural paths were statistically supported (*p* < 0.05), providing substantial empirical support for the proposed ISM model. **Academic and Education Quality (AR)** positively predicted all four endogenous constructs, with the largest effects on Sociocultural Adaptation (β = 0.483, *f*² = 0.573, large) and Information Needs (β = 0.469, *f*² = 0.174, medium). **Administrative and Staff Support (HS)** exerted particularly strong effects on Situational Issue management (β = 0.669, *f*² = 1.291, very large) and Sociocultural Adaptation (β = 0.490, *f*² = 0.598, large). The only non-significant path was HS → IA (β = 0.322, *p* = 0.104), suggesting that administrative support does not independently predict information needs satisfaction when academic quality is simultaneously considered. The model explains substantial variance in Sociocultural Adaptation (*R*² = 0.838) and Situational Issue (*R*² = 0.862), confirming the strong predictive utility of institutional quality factors in shaping international students' adaptation and information experiences in Thai higher education.

---

## References

Cohen, J. (1988). *Statistical power analysis for the behavioral sciences* (2nd ed.). Lawrence Erlbaum Associates.

Hair, J. F., Risher, J. J., Sarstedt, M., & Ringle, C. M. (2019). When to use and how to report results of PLS-SEM. *European Business Review*, *31*(1), 2–24. https://doi.org/10.1108/EBR-11-2018-0203

Ringle, C. M., Sarstedt, M., & Straub, D. W. (2015). Editor's comments: A critical look at the use of PLS-SEM in MIS Quarterly. *MIS Quarterly*, *36*(1), iii–xiv. https://doi.org/10.2307/41410402

---

> **Files in this folder (Results/ModelB_Final/):**
> - `ISM_PLS_Model_Diagram.png` — PLS-SEM path model diagram (this figure)
> - `ISM_Methods_Results.md` — This document (Markdown)
> - `01_loadings.csv` — Outer loadings
> - `02_reliability_AVE.csv` — Reliability and AVE
> - `03_HTMT.csv` — HTMT discriminant validity
> - `04_paths_R2.csv` — Path coefficients and R²
> - `05_VIF.csv` — VIF values
> - `06_f2_effect_sizes.csv` — Cohen's f² effect sizes
> - `07_bootstrap_paths.csv` — Bootstrapped paths with CI and p-values
> - `08_bootstrap_loadings.csv` — Bootstrapped loadings with CI
> - `09_bootstrap_HTMT.csv` — Bootstrapped HTMT
> - `ModelB_script.R` — Full reproducible R script
> - `ModelB_Summary_Report.txt` — Plain-text summary report
>
> **Software:** R 4.6.0 · seminr 2.4.2 · Bootstrap = 5,000 · seed = 2026

