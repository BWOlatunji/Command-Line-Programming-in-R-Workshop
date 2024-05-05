library(ggplot2)
library(ggpubr)
library(palmerpenguins)

create_plots_pdf <- function(output_filename, group_name){
  
  # Histogram example: flipper length by species
  gg1 <- ggplot(data = penguins, aes(x = flipper_length_mm)) +
    geom_histogram(aes(fill = {{group_name}}), alpha = 0.5, position = "identity") +
    scale_fill_manual(values = c("darkorange","darkorchid","cyan4"))
  
  
  gg2 <- # Scatterplot example 1: penguin flipper length versus body mass
    ggplot(data = penguins, aes(x = flipper_length_mm, y = body_mass_g)) +
    geom_point(aes(color = {{group_name}}, 
                   shape = {{group_name}}),
               size = 2) +
    scale_color_manual(values = c("darkorange","darkorchid","cyan4")) 
  
  
  # Jitter plot example: bill length by species
  gg3 <- ggplot(data = penguins, aes(x = {{group_name}}, y = bill_length_mm)) +
    geom_jitter(aes(color = {{group_name}}),
                width = 0.1, 
                alpha = 0.7,
                show.legend = FALSE) +
    scale_color_manual(values = c("darkorange","darkorchid","cyan4"))
  
  
  
  final_plot <- ggarrange(
    gg1,                # First row with line plot
    # Second row with box and dot plots
    ggarrange(
      gg2, gg3, ncol = 2, common.legend = TRUE,
      labels = c("B", "C"),
      legend = "bottom"
    ), 
    nrow = 2, 
    labels = "A"       # Label of the line plot
  ) 
  
  ggexport(final_plot, filename = output_filename)
}

x <- commandArgs(trailingOnly = TRUE)
variable1 <- x[1]
variable2 <- x[2]

# create_plots_pdf(data_filename = "penguins.csv",group_name = species)
create_plots_pdf(output_filename=variable1,group_name=variable2)
