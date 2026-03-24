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

# ===== ANOVA: Cluster 1 (Heart Rate + HRV) =====
print("===== ANOVA: Heart Rate + HRV Clustering =====")

# Test for normality (Shapiro-Wilk)
print("Shapiro-Wilk Test for Normality:")
print(tapply(df$average_heart_rate, df$cluster, shapiro.test))

# Test for homogeneity of variance (Levene's test)
print("\nLevene's Test for Homogeneity of Variance:")
print(leveneTest(average_heart_rate ~ as.factor(cluster), data = df))

# One-way ANOVA
anova_result <- aov(average_heart_rate ~ as.factor(cluster), data = df)
print("\nOne-way ANOVA for Heart Rate:")
print(summary(anova_result))

# Post-hoc test (Tukey HSD)
print("\nTukey HSD Post-hoc Test:")
print(TukeyHSD(anova_result))

# Repeat for HRV
print("\n===== ANOVA: Average HRV =====")
anova_hrv <- aov(average_hrv ~ as.factor(cluster), data = df)
print(summary(anova_hrv))
print(TukeyHSD(anova_hrv))

# Repeat for Sleep Duration
print("\n===== ANOVA: Sleep Duration =====")
anova_sleep <- aov(total_sleep_duration ~ as.factor(cluster), data = df)
print(summary(anova_sleep))
print(TukeyHSD(anova_sleep))

print("\n✅ Analysis complete!")