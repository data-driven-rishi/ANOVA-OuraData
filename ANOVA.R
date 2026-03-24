# Set CRAN mirror
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# Install packages if not already installed
packages <- c('tidyverse', 'ggplot2', 'car', 'multcomp')
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

# Read the clustering results from Python
df <- read.csv('../KMeansClusteringProject/all_clustering_results.csv')

print("Data loaded successfully!")
print(paste("Rows:", nrow(df)))
print(colnames(df))

# Remove rows with missing values
df_clean <- na.omit(df)
print(paste("Rows after removing NAs:", nrow(df_clean)))

# ===== ANOVA: Heart Rate (cluster2) =====
print("\n===== ANOVA: Average Heart Rate (2 Clusters) =====")
anova_hr2 <- aov(average_heart_rate ~ as.factor(cluster2), data = df_clean)
print(summary(anova_hr2))
print("Tukey HSD Test:")
print(TukeyHSD(anova_hr2))

# ===== ANOVA: HRV (cluster2) =====
print("\n===== ANOVA: Average HRV (2 Clusters) =====")
anova_hrv2 <- aov(average_hrv ~ as.factor(cluster2), data = df_clean)
print(summary(anova_hrv2))
print("Tukey HSD Test:")
print(TukeyHSD(anova_hrv2))

# ===== ANOVA: Sleep Duration (cluster2) =====
print("\n===== ANOVA: Total Sleep Duration (2 Clusters) =====")
anova_sleep2 <- aov(total_sleep_duration ~ as.factor(cluster2), data = df_clean)
print(summary(anova_sleep2))
print("Tukey HSD Test:")
print(TukeyHSD(anova_sleep2))

# ===== ANOVA: Heart Rate (cluster3) =====
print("\n===== ANOVA: Average Heart Rate (3 Clusters) =====")
anova_hr3 <- aov(average_heart_rate ~ as.factor(cluster3), data = df_clean)
print(summary(anova_hr3))
print("Tukey HSD Test:")
print(TukeyHSD(anova_hr3))

# ===== ANOVA: HRV (cluster3) =====
print("\n===== ANOVA: Average HRV (3 Clusters) =====")
anova_hrv3 <- aov(average_hrv ~ as.factor(cluster3), data = df_clean)
print(summary(anova_hrv3))
print("Tukey HSD Test:")
print(TukeyHSD(anova_hrv3))

# ===== ANOVA: Sleep Duration (cluster3) =====
print("\n===== ANOVA: Total Sleep Duration (3 Clusters) =====")
anova_sleep3 <- aov(total_sleep_duration ~ as.factor(cluster3), data = df_clean)
print(summary(anova_sleep3))
print("Tukey HSD Test:")
print(TukeyHSD(anova_sleep3))

print("\n✅ ANOVA Analysis Complete!")