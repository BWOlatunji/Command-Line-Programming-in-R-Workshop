#!/usr/bin/env Rscript
library(ggplot2)
library(ggpubr)
library(palmerpenguins)

# Histogram example: flipper length by species
gg1 <- ggplot(data = penguins, aes(x = flipper_length_mm)) +
  geom_histogram(aes(fill = species), alpha = 0.5, position = "identity") +
  scale_fill_manual(values = c("darkorange", "darkorchid", "cyan4"))


gg2 <- # Scatterplot example 1: penguin flipper length versus body mass
  ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
  geom_point(aes(color = species, shape = species), size = 2) +
  scale_color_manual(values = c("darkorange", "darkorchid", "cyan4"))


# Jitter plot example: bill length by species
gg3 <- ggplot(data = penguins, aes(x = species, y = bill_length_mm)) +
  geom_jitter(
    aes(color = species),
    width = 0.1,
    alpha = 0.7,
    show.legend = FALSE
  ) +
  scale_color_manual(values = c("darkorange", "darkorchid", "cyan4"))



final_plot <- ggarrange(
  gg1,
  # First row with line plot
  # Second row with box and dot plots
  ggarrange(
    gg2,
    gg3,
    ncol = 2,
    common.legend = TRUE,
    labels = c("B", "C"),
    legend = "bottom"
  ),
  nrow = 2,
  labels = "A"       # Label of the line plot
)
ggsave(filename = "ggplot.png",plot = final_plot)
#ggexport(final_plot, filename = "my_r_script_plots.pdf")
