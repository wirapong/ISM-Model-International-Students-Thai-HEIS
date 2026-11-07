library(readxl); library(dplyr); library(seminr)

BASE <- "/Users/wirapongc/Library/CloudStorage/GoogleDrive-wirach@kku.ac.th/My Drive/OpenClawMacMini/Paiboon/PLS-SEM"
OUT  <- file.path(BASE, "Results")
dir.create(OUT, recursive=TRUE, showWarnings=FALSE)

# 1. Load data
raw   <- read_excel(file.path(BASE, "data.xlsx"), sheet="Factors")
items <- c(paste0("IA",1:4), paste0("AR",5:10), paste0("LC",11:13),
           paste0("HS",14:18), paste0("HT",19:21), paste0("SI",22:27),
           paste0("PA",28:32))
dat   <- as.data.frame(lapply(raw[,items], function(x) as.numeric(as.character(x))))

# Data quality
dq <- data.frame(Item=items,
                 Missing=sapply(dat, function(x) sum(is.na(x))),
                 Mean=round(sapply(dat, mean, na.rm=TRUE),3),
                 SD=round(sapply(dat, sd, na.rm=TRUE),3))
write.csv(dq, file.path(OUT,"01_data_quality.csv"), row.names=FALSE)
cat("Missing values:\n"); print(sapply(dat, function(x) sum(is.na(x))))

n0  <- nrow(dat)
adat <- dat[complete.cases(dat),]
n1  <- nrow(adat)
cat(sprintf("n=%d (before) -> %d (after listwise), removed=%d\n", n0, n1, n0-n1))

# 2. Measurement model (all reflective)
mm <- constructs(
  reflective("IA", multi_items("IA",1:4)),
  reflective("AR", multi_items("AR",5:10)),
  reflective("LC", multi_items("LC",11:13)),
  reflective("HS", multi_items("HS",14:18)),
  reflective("HT", multi_items("HT",19:21)),
  reflective("SI", multi_items("SI",22:27)),
  reflective("PA", multi_items("PA",28:32))
)

# 3. Structural model: Direct/Parallel
sm <- relationships(
  paths(from=c("AR","HS","HT"), to="PA"),
  paths(from=c("AR","HS","HT"), to="LC"),
  paths(from=c("AR","HS","HT"), to="IA"),
  paths(from=c("AR","HS","HT"), to="SI")
)

# 4. Estimate PLS
pls <- estimate_pls(data=adat, measurement_model=mm, structural_model=sm,
                    inner_weights=path_weighting, missing=mean_replacement)
s   <- summary(pls)

cat("\n=== LOADINGS ===\n"); print(round(s$loadings,3))
cat("\n=== RELIABILITY & AVE ===\n"); print(round(s$reliability,3))
cat("\n=== PATHS & R2 ===\n"); print(round(s$paths,3))
cat("\n=== VIF ===\n"); print(round(s$vif_antecedents,3))
cat("\n=== f2 ===\n"); print(round(s$fSquare,3))
htmt <- tryCatch(s$validity$htmt, error=function(e) s$validity)
cat("\n=== HTMT ===\n"); print(round(htmt,3))

# 5. Bootstrap
cat("\nBootstrapping 5000 reps...\n")
set.seed(2026)
boot <- bootstrap_model(pls, nboot=5000,
                        cores=max(1,parallel::detectCores()-1), seed=2026)
b    <- summary(boot, alpha=0.05)
cat("\n=== BOOTSTRAPPED PATHS ===\n"); print(round(b$bootstrapped_paths,4))
cat("\n=== BOOTSTRAPPED LOADINGS ===\n"); print(round(b$bootstrapped_loadings,3))

# 6. Export tables
sc <- function(obj,f){ if(!is.null(obj)) tryCatch(write.csv(as.data.frame(obj), file.path(OUT,f), row.names=TRUE), error=function(e) NULL) }
sc(s$loadings,              "03_loadings.csv")
sc(s$reliability,           "04_reliability_AVE.csv")
sc(htmt,                    "05_HTMT.csv")
sc(s$paths,                 "06_paths_R2.csv")
sc(s$vif_antecedents,       "07_VIF_structural.csv")
sc(s$fSquare,               "08_f2.csv")
sc(b$bootstrapped_paths,    "09_bootstrap_paths.csv")
sc(b$bootstrapped_loadings, "10_bootstrap_loadings.csv")
if(!is.null(b$bootstrapped_HTMT)) sc(b$bootstrapped_HTMT, "11_bootstrap_HTMT.csv")
write.csv(dq, file.path(OUT,"02_descriptive_stats.csv"), row.names=FALSE)
cat("\n✅ All CSV files saved to Results/\n")

# 7. Summary report text
rel  <- as.data.frame(s$reliability)
bp   <- as.data.frame(b$bootstrapped_paths)
rep_lines <- c(
  "================================================================",
  "ISM PLS-SEM SUMMARY REPORT — DIRECT/PARALLEL MODEL",
  paste("Thesis: ISM for International Students in Thailand HE"),
  paste("Researcher: Paiboon Manororm | Advisor: Assoc.Prof.Dr.Wirapong Chansanam"),
  paste("Analysis date:", Sys.Date()),
  "================================================================",
  "",
  "A. SAMPLE",
  paste0("   n = ", n1, " (listwise deletion from ", n0, ")"),
  "",
  "B. MEASUREMENT MODEL — Reflective Constructs",
  "   Target: Loadings >=0.708 | alpha/rhoC 0.70-0.95 | AVE >=0.50 | HTMT <0.85",
  "",
  "   Reliability & AVE:",
  capture.output(print(round(rel,3))),
  "",
  "   Outer Loadings:",
  capture.output(print(round(s$loadings,3))),
  "",
  "   HTMT (Discriminant Validity):",
  capture.output(print(round(htmt,3))),
  "",
  "C. STRUCTURAL MODEL — 12 Paths (AR,HS,HT -> PA,LC,IA,SI)",
  "   Bootstrap: nboot=5000, seed=2026",
  "",
  "   Bootstrapped Path Results:",
  capture.output(print(round(bp,4))),
  "",
  "D. MODEL QUALITY",
  "   R2 and f2 for endogenous constructs:",
  capture.output(print(round(s$paths,3))),
  capture.output(print(round(s$fSquare,3))),
  "",
  "   VIF (all should be < 5.0):",
  capture.output(print(round(s$vif_antecedents,3))),
  "",
  "E. SOFTWARE",
  paste(" ", R.version.string),
  paste("  seminr:", as.character(packageVersion("seminr"))),
  "================================================================"
)
writeLines(rep_lines, file.path(OUT,"ISM_PLS_Summary_Report.txt"))
cat("✅ Summary report saved.\n")

# 8. Save ACTUAL complete R script
script_full <- readLines("/tmp/ism_plssem.R")
writeLines(script_full, file.path(OUT,"ISM_PLS_script_v2.R"))
cat("✅ Complete R script saved as ISM_PLS_script_v2.R\n")

# 9. FINAL CONSOLE OUTPUT
cat("\n")
cat("================================================================\n")
cat("FINAL RESULTS — ISM PLS-SEM DIRECT/PARALLEL MODEL\n")
cat(sprintf("n = %d | 7 constructs | 12 paths | Bootstrap = 5000\n\n", n1))
cat("RELIABILITY & AVE:\n"); print(round(rel[,c("alpha","rhoA","rhoC","AVE")],3))
cat("\nSTRUCTURAL PATHS (Bootstrapped):\n")
print(round(bp,4))
r2_col <- grep("R\\^2$|^R2$|Rsq", colnames(s$paths), value=TRUE, ignore.case=TRUE)[1]
if(!is.na(r2_col)){
  cat(sprintf("\nR2 for endogenous constructs:\n"))
  r2_rows <- c("PA","LC","IA","SI")
  r2_rows <- r2_rows[r2_rows %in% rownames(s$paths)]
  print(s$paths[r2_rows, grep("R",colnames(s$paths),ignore.case=TRUE), drop=FALSE])
}
cat("================================================================\n")
cat("Files saved to:", OUT, "\n")
