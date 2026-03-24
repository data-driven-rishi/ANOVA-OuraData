# Set CRAN mirror
options(repos = c(CRAN = "https://cran.rstudio.com/"))

# Install packages if not already installed
packages <- c('tidyverse', 'ggplot2', 'gridExtra')
for (pkg in packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}

# Read the clustering results
df <- read.csv('../KMeansClusteringProject/all_clustering_results.csv')
df_clean <- na.omit(df)

# ===== BOX PLOTS: 2 Clusters =====
print("Creating box plots for 2-cluster model...")

p1 <- ggplot(df_clean, aes(x = as.factor(cluster2), y = average_heart_rate, fill = as.factor(cluster2))) +
  geom_boxplot() +
  labs(title = "Heart Rate by Cluster (2-Cluster Model)", x = "Cluster", y = "Average Heart Rate") +
  theme_minimal() +
  theme(legend.position = "none")

p2 <- ggplot(df_clean, aes(x = as.factor(cluster2), y = average_hrv, fill = as.factor(cluster2))) +
  geom_boxplot() +
  labs(title = "HRV by Cluster (2-Cluster Model)", x = "Cluster", y = "Average HRV") +
  theme_minimal() +
  theme(legend.position = "none")

p3 <- ggplot(df_clean, aes(x = as.factor(cluster2), y = total_sleep_duration, fill = as.factor(cluster2))) +
  geom_boxplot() +
  labs(title = "Sleep Duration by Cluster (2-Cluster Model)", x = "Cluster", y = "Total Sleep Duration") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("ANOVA_2Cluster_Boxplots.png", gridExtra::grid.arrange(p1, p2, p3, ncol = 3), width = 15, height = 5)
print("✅ Saved: ANOVA_2Cluster_Boxplots.png")

# ===== BOX PLOTS: 3 Clusters =====
print("Creating box plots for 3-cluster model...")

p4 <- ggplot(df_clean, aes(x = as.factor(cluster3), y = average_heart_rate, fill = as.factor(cluster3))) +
  geom_boxplot() +
  labs(title = "Heart Rate by Cluster (3-Cluster Model)", x = "Cluster", y = "Average Heart Rate") +
  theme_minimal() +
  theme(legend.position = "none")

p5 <- ggplot(df_clean, aes(x = as.factor(cluster3), y = average_hrv, fill = as.factor(cluster3))) +
  geom_boxplot() +
  labs(title = "HRV by Cluster (3-Cluster Model)", x = "Cluster", y = "Average HRV") +
  theme_minimal() +
  theme(legend.position = "none")

p6 <- ggplot(df_clean, aes(x = as.factor(cluster3), y = total_sleep_duration, fill = as.factor(cluster3))) +
  geom_boxplot() +
  labs(title = "Sleep Duration by Cluster (3-Cluster Model)", x = "Cluster", y = "Total Sleep Duration") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("ANOVA_3Cluster_Boxplots.png", gridExtra::grid.arrange(p4, p5, p6, ncol = 3), width = 15, height = 5)
print("✅ Saved: ANOVA_3Cluster_Boxplots.png")

# ===== VIOLIN PLOTS: 2 Clusters =====
print("Creating violin plots for 2-cluster model...")

v1 <- ggplot(df_clean, aes(x = as.factor(cluster2), y = average_heart_rate, fill = as.factor(cluster2))) +
  geom_violin() +
  geom_jitter(width = 0.2, alpha = 0.3) +
  labs(title = "Heart Rate Distribution (2-Cluster Model)", x = "Cluster", y = "Average Heart Rate") +
  theme_minimal() +
  theme(legend.position = "none")

v2 <- ggplot(df_clean, aes(x = as.factor(cluster2), y = average_hrv, fill = as.factor(cluster2))) +
  geom_violin() +
  geom_jitter(width = 0.2, alpha = 0.3) +
  labs(title = "HRV Distribution (2-Cluster Model)", x = "Cluster", y = "Average HRV") +
  theme_minimal() +
  theme(legend.position = "none")

v3 <- ggplot(df_clean, aes(x = as.factor(cluster2), y = total_sleep_duration, fill = as.factor(cluster2))) +
  geom_violin() +
  geom_jitter(width = 0.2, alpha = 0.3) +
  labs(title = "Sleep Duration Distribution (2-Cluster Model)", x = "Cluster", y = "Total Sleep Duration") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("ANOVA_2Cluster_Violins.png", gridExtra::grid.arrange(v1, v2, v3, ncol = 3), width = 15, height = 5)
print("✅ Saved: ANOVA_2Cluster_Violins.png")

# ===== VIOLIN PLOTS: 3 Clusters =====
print("Creating violin plots for 3-cluster model...")

v4 <- ggplot(df_clean, aes(x = as.factor(cluster3), y = average_heart_rate, fill = as.factor(cluster3))) +
  geom_violin() +
  geom_jitter(width = 0.2, alpha = 0.3) +
  labs(title = "Heart Rate Distribution (3-Cluster Model)", x = "Cluster", y = "Average Heart Rate") +
  theme_minimal() +
  theme(legend.position = "none")

v5 <- ggplot(df_clean, aes(x = as.factor(cluster3), y = average_hrv, fill = as.factor(cluster3))) +
  geom_violin() +
  geom_jitter(width = 0.2, alpha = 0.3) +
  labs(title = "HRV Distribution (3-Cluster Model)", x = "Cluster", y = "Average HRV") +
  theme_minimal() +
  theme(legend.position = "none")

v6 <- ggplot(df_clean, aes(x = as.factor(cluster3), y = total_sleep_duration, fill = as.factor(cluster3))) +
  geom_violin() +
  geom_jitter(width = 0.2, alpha = 0.3) +
  labs(title = "Sleep Duration Distribution (3-Cluster Model)", x = "Cluster", y = "Total Sleep Duration") +
  theme_minimal() +
  theme(legend.position = "none")

ggsave("ANOVA_3Cluster_Violins.png", gridExtra::grid.arrange(v4, v5, v6, ncol = 3), width = 15, height = 5)
print("✅ Saved: ANOVA_3Cluster_Violins.png")

print("\n✅ All visualizations complete!")